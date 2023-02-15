abstract class IBaseRepository<T> {
  Future<List<T>?> fetchAll();
}