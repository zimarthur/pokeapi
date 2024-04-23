enum PageStatus { ok, loading, error }

extension PageStatusExtension on PageStatus {
  bool get isLoading {
    return this == PageStatus.loading;
  }

  bool get hasError {
    return this == PageStatus.error;
  }
}
