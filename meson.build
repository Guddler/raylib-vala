project('rtest', ['c', 'vala'], version: '0.1.0')

vapi_dir = meson.current_source_dir() / 'vapi'

add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

rtest_deps = [
	dependency('glib-2.0'),
	dependency('raylib')
]

test_srcs = files('src/rtest.vala')

executable('rtest', test_srcs, dependencies: rtest_deps)