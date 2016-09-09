require.config(
  baseUrl: '/lib/assets/src'
  waitSeconds: 0
  paths:
    'jquery': '../vendor/jquery.min'
    'lodash': '../vendor/lodash.compat.min'
  shim:
    'jquery':
      exports: '$'
    'lodash':
      exports: '_'
)
