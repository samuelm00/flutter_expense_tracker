abstract class CrudService<T> {
  Future<List<T>> getItems();
  Future<T> addItem(T item);
  Future<void> deleteItem(String id);
}
