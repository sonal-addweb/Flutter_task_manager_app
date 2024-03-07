// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_task_manager_app/test/presentation/blocs/todo/todo_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:flutter_task_manager_app/src/domain/entities/task_entity.dart'
    as _i7;
import 'package:flutter_task_manager_app/src/domain/failures/failures.dart'
    as _i6;
import 'package:flutter_task_manager_app/src/domain/repositories/database_repository.dart'
    as _i2;
import 'package:flutter_task_manager_app/src/domain/usecases/task_usecases.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDatabaseRepository_0 extends _i1.SmartFake
    implements _i2.DatabaseRepository {
  _FakeDatabaseRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FetchTask].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchTask extends _i1.Mock implements _i4.FetchTask {
  MockFetchTask() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DatabaseRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeDatabaseRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.DatabaseRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.TaskEntity>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.TaskEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.TaskEntity>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.TaskEntity>>>);
}

/// A class which mocks [AddTask].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddTask extends _i1.Mock implements _i4.AddTask {
  MockAddTask() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DatabaseRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeDatabaseRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.DatabaseRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.TaskEntity>> execute(
          _i7.TaskEntity? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [task],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.TaskEntity>>.value(
            _FakeEither_1<_i6.Failure, _i7.TaskEntity>(
          this,
          Invocation.method(
            #execute,
            [task],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.TaskEntity>>);
}

/// A class which mocks [DeleteTask].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteTask extends _i1.Mock implements _i4.DeleteTask {
  MockDeleteTask() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DatabaseRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeDatabaseRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.DatabaseRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.TaskEntity>>> execute(
          _i7.TaskEntity? task) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [task],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.TaskEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.TaskEntity>>(
          this,
          Invocation.method(
            #execute,
            [task],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.TaskEntity>>>);
}
