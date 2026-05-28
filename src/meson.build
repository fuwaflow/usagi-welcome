blueprints = custom_target('blueprints',
  input: files(
    'gtk/help-overlay.blp',
    'window.blp',
  ),
  output: '.',
  command: [find_program('blueprint-compiler'), 'batch-compile', '--minify', '@OUTPUT@', '@CURRENT_SOURCE_DIR@', '@INPUT@'],
)

welcome_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
]

welcome_deps = [
  config_dep,
  dependency('gtk4'),
  dependency('libadwaita-1'),
  dependency('granite-7')
]

welcome_sources += gnome.compile_resources('welcome-resources',
  'welcome.gresource.xml',
  dependencies: blueprints,
  c_name: 'welcome'
)

executable('welcome', welcome_sources,
  dependencies: welcome_deps,
  include_directories: config_inc,
  install: true,
)