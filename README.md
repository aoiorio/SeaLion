## 🧩 SeaLion is my demo app for everything 🧩

### 🎪 SeaLion's folder structure.
- I applied Layered Structure
```
└── 📁lib
    └── 📁features
        └── 📁todo
            └── 📁application
                └── 📁providers
                    └── 📁delete_todo
                        └── delete_todo.dart
                        └── delete_todo.g.dart
                    └── 📁post_todo
                        └── post_todo.dart
                        └── post_todo.g.dart
                    └── 📁read_todo
                        └── read_specific_todo.dart
                        └── read_specific_todo.g.dart
                        └── read_todo.dart
                        └── read_todo.g.dart
                    └── 📁udpate_todo
                        └── update_todo.dart
                        └── update_todo.g.dart
                └── 📁usecases
                    └── delete_todo_usecase_impl.dart
                    └── post_todo_usecase_impl.dart
                    └── read_todo_usecase_impl.dart
                    └── update_todo_usecase_impl.dart
            └── 📁delete_todo
                └── 📁domain
                    └── 📁repository
                        └── delete_todo_repository.dart
                    └── 📁usecase
                        └── delete_todo_usecase.dart
                └── 📁infrastructure
                    └── 📁datasource
                        └── delete_todo_data_source.dart
                        └── delete_todo_data_source.g.dart
                    └── 📁providers
                        └── delete_todo_provider.dart
                    └── 📁repository
                        └── delete_todo_repository_impl.dart
            └── 📁entity
                └── todo_entity.dart
            └── 📁models
                └── todo_model.dart
                └── todo_request_body.dart
                └── todo_request_body.g.dart
            └── 📁post_todo
                └── 📁domain
                    └── 📁repository
                        └── post_todo_repository.dart
                    └── 📁usecase
                        └── post_todo_use_case.dart
                └── 📁infrastructure
                    └── 📁datasource
                        └── post_todo_data_source.dart
                        └── post_todo_data_source.g.dart
                    └── 📁providers
                        └── post_todo.dart
                    └── 📁repository
                        └── post_todo_repository_impl.dart
            └── 📁read_todo
                └── 📁domain
                    └── 📁repositories
                        └── read_todo_repository.dart
                    └── 📁usecases
                        └── read_todo_usecase.dart
                └── 📁infrastracture
                    └── 📁datasources
                        └── read_all_todos_data_source.dart
                        └── read_all_todos_data_source.g.dart
                    └── 📁providers
                        └── read_todos.dart
                    └── 📁repository
                        └── read_todo_repository_impl.dart
            └── 📁update_todo
                └── 📁domain
                    └── 📁repositories
                        └── update_todo_repository.dart
                    └── 📁usecases
                        └── update_todo_usecase.dart
                └── 📁infrastructure
                    └── 📁datasources
                        └── update_todo_data_source.dart
                        └── update_todo_data_source.g.dart
                    └── 📁providers
                        └── update_todo.dart
                    └── 📁repository
                        └── update_todo_repository_impl.dart
    └── main.dart
    └── 📁presentation
        └── 📁components
            └── text.dart
        └── 📁config
            └── env.dart
        └── 📁pages
            └── home.dart
            └── post.dart
            └── search.dart
        └── 📁resources
            └── data_state.dart
```