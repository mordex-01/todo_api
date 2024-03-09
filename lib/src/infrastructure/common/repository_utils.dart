class RepositoryUtils {
  static const String webBaseUrl = '127.0.0.1:3000';
  static const String getTodos = '/todos';
  static const String addTodos = '/todos';
  static String deleteTodo(String id) => '/todos/$id';
}
