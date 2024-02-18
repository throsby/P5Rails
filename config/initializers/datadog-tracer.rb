# config/initializers/datadog-tracer.rb
Datadog.configure do |c|
    c.env = 'development'
    c.service = 'rubyprojectbackend'
    c.tracing.sampling.default_rate = 1.0
    c.profiling.enabled = true
    c.appsec.enabled = true
  end