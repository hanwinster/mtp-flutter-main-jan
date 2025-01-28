enum FileDownloadStatus {
  enqueued,
  running,
  complete,
  notFound,
  failed,
  canceled,
  waitingToRetry,
  paused,
  unknown,
}