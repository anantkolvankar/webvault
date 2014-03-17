#config/initializers/simple_roles.rb
SimpleRoles.configure do
  valid_roles :superadmin, :admin, :fetcher
  strategy :one # Default is :one
end