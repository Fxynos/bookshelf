abstract class BlockingUseCase<T, R> {
  R invoke(T param);
}

abstract class AsyncUseCase<T, R> {
  Future<R> invoke(T param);
}