import 'package:base/base.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class MtpWebView extends StatefulWidget {
  const MtpWebView({super.key, required this.url});

  final String url;

  @override
  State<MtpWebView> createState() => _MtpWebViewState();
}

class _MtpWebViewState extends State<MtpWebView> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
    isInspectable: kDebugMode,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    iframeAllowFullscreen: false,
    javaScriptEnabled: true,
  );
  PullToRefreshController? pullToRefreshController;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    pullToRefreshController = kIsWeb
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(
              color: Colors.blue,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                webViewController?.loadUrl(
                    urlRequest:
                        URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          key: webViewKey,
          initialUrlRequest: URLRequest(url: WebUri(widget.url)),
          initialSettings: settings,
          pullToRefreshController: pullToRefreshController,
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onLoadStart: (controller, url) {},
          onPermissionRequest: (controller, request) async {
            return PermissionResponse(
                resources: request.resources,
                action: PermissionResponseAction.GRANT);
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            var uri = navigationAction.request.url!;

            if (![
              "http",
              "https",
              "file",
              "chrome",
              "data",
              "javascript",
              "about"
            ].contains(uri.scheme)) {
              if (await canLaunchUrl(uri)) {
                // Launch the App
                await launchUrl(
                  uri,
                );
                // and cancel the request
                return NavigationActionPolicy.CANCEL;
              }
            }

            return NavigationActionPolicy.ALLOW;
          },
          onLoadStop: (controller, url) async {
            pullToRefreshController?.endRefreshing();
          },
          onReceivedError: (controller, request, error) {
            pullToRefreshController?.endRefreshing();
          },
          onProgressChanged: (controller, progress) {
            if (progress == 100) {
              pullToRefreshController?.endRefreshing();
            }
            setState(() {
              this.progress = progress / 100;
            });
          },
          onUpdateVisitedHistory: (controller, url, androidIsReload) {},
          onConsoleMessage: (controller, consoleMessage) {
            if (kDebugMode) {
              logger.d(consoleMessage.message);
            }
          },
        ),
        progress < 1.0
            ? LinearProgressIndicator(
                backgroundColor: context.colorScheme.primary.withOpacity(0.12),
                color: context.colorScheme.primary,
                minHeight: 2,
              )
            : Container(),
      ],
    );
  }
}
