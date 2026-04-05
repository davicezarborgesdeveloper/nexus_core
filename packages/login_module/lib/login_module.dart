// Domain
export 'src/domain/entities/auth_session.dart';
export 'src/domain/contracts/auth_repository.dart';
export 'src/domain/contracts/session_storage.dart';
export 'src/domain/errors/auth_failure.dart';
export 'src/domain/result.dart';
export 'src/domain/usecases/sign_in.dart';
export 'src/domain/usecases/sign_out.dart';

// Infra (implementação de referência sem dependências externas)
export 'src/infra/in_memory_session_storage.dart';

// Presentation
export 'src/presentation/login_theme.dart';
export 'src/presentation/states/login_state.dart';
export 'src/presentation/controllers/login_controller.dart';
export 'src/presentation/pages/login_page.dart';

// Module factory
export 'src/login_module.dart';
