LT = require 'lt'
sysPath = require 'path'

module.exports = class LTCompiler
  brunchPlugin: yes
  type: 'template'
  extension: 'hbs'
  pattern: /\.(?:hbs)$/

  constructor: (@config) ->
    null

  compile: (data, path, callback) ->
    try
      content = LT.compile data
      result = "module.exports = LT.render(#{content});"
    catch err
      error = err
    finally
      callback error, result

  include: [
    (sysPath.join __dirname, '..', 'vendor',
      'lt.runtime-0.3.3.js')
  ]
