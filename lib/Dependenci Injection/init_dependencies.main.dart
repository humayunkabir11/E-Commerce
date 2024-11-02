part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initSplash();
  _initLogin();
  _initHome();
  _initMain();
  _initOrder();
  _initSettings();
  _initSbu();
  _initCart();

  serviceLocator.registerFactory(() => InternetConnection());

  /// core
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );

  ///db
  serviceLocator.registerFactory<LocationConfig>(
    () => LocationConfig(),
  );

  ///db
  serviceLocator.registerFactory<DBHelper>(
    () => DBHelper(),
  );

  ///Api client
  serviceLocator.registerFactory<ApiMethod>(
    () => ApiMethod(),
  );
}

void _initSplash() {
  /// Datasource
  serviceLocator
    ..registerFactory<SplashRemoteSource>(
      () => SplashRemoteSourceImpl(
        apiMethod: serviceLocator(),
      ),
    )

    /// Repository
    ..registerFactory<SplashRepository>(() => SplashRepositoryImpl(
        connectionChecker: serviceLocator(), remoteSource: serviceLocator()))
    ..registerFactory(
      () => SplashUseCase(
        splashRepository: serviceLocator(),
      ),
    );
}

/// home login
void _initLogin() {
  /// Datasource
  serviceLocator
    ..registerFactory<LoginRemoteSource>(
      () => LoginRemoteSourceImpl(
        apiMethod: serviceLocator(),
      ),
    )

    /// Repository
    ..registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(
          connectionChecker: serviceLocator(), remoteSource: serviceLocator()),
    )

    /// Usecases
    ..registerFactory(
      () => LoginUseCase(
        loginRepository: serviceLocator(),
      ),
    );
}

/// settings
void _initSettings() {
  /// Datasource
  serviceLocator
    ..registerFactory<SettingsRemoteSource>(
      () => SettingsRemoteSourceImpl(
        apiMethod: serviceLocator(),
      ),
    )

    /// Repository
    ..registerFactory<SettingsRepository>(
      () => SettingsRepositoryImpl(
          connectionChecker: serviceLocator(), remoteSource: serviceLocator()),
    )

    /// Usecases
    ..registerFactory(
      () => SettingsUseCase(
        settingsRepository: serviceLocator(),
      ),
    );
}

void _initSbu() {
  /// Datasource
  serviceLocator
    ..registerFactory<SbuRemoteSource>(
      () => SbuRemoteSourceImpl(
        apiMethod: serviceLocator(),
      ),
    )

    /// Repository
    ..registerFactory<SbuRepository>(
      () => SbuRepositoryImpl(
          connectionChecker: serviceLocator(), remoteSource: serviceLocator()),
    )

    /// Usecases
    ..registerFactory(
      () => SbuUseCase(
        sbuRepository: serviceLocator(),
      ),
    );
}

/// home init
void _initHome() {
  /// Datasource
  serviceLocator
    ..registerFactory<HomeRemoteSource>(
      () => HomeRemoteSourceImpl(
        apiMethod: serviceLocator(),
      ),
    )

    /// Repository
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(
          connectionChecker: serviceLocator(), remoteSource: serviceLocator()),
    )

    /// Usecases
    ..registerFactory(
      () => HomeUseCase(
        homeRepository: serviceLocator(),
      ),
    );
}

void _initOrder() {
  serviceLocator
    ..registerFactory<OrderRemoteSource>(
      () => OrderRemoteSourceImpl(
        apiMethod: serviceLocator(),
      ),
    )

    /// Repository
    ..registerFactory<OrderRepository>(
      () => OrderRepositoryImpl(
          connectionChecker: serviceLocator(), remoteSource: serviceLocator()),
    )

    /// Usecases
    ..registerFactory(
      () => OrderUseCase(
        orderRepository: serviceLocator(),
      ),
    );
}

void _initMain() {
  /// Datasource
  serviceLocator
    ..registerFactory<MainRemoteSource>(
      () => MainRemoteSourceImpl(
        apiMethod: serviceLocator(),
      ),
    )

    /// Repository
    ..registerFactory<MainRepository>(
      () => MainRepositoryImpl(
          connectionChecker: serviceLocator(), remoteSource: serviceLocator()),
    )

    /// Usecases
    ..registerFactory(
      () => MainUseCase(
        mainRepository: serviceLocator(),
      ),
    );
}

void _initCart() {
  /// Datasource
  serviceLocator
    ..registerFactory<CartRemoteSource>(
      () => CartRemoteSourceImpl(
        apiMethod: serviceLocator(),
      ),
    )

    /// Repository
    ..registerFactory<CartRepository>(
      () => CartRepositoryImpl(
          connectionChecker: serviceLocator(), remoteSource: serviceLocator()),
    )

    /// Usecases
    ..registerFactory(
      () => CartUseCase(
        cartRepository: serviceLocator(),
      ),
    );
}
