alias EctoJsonbExample.Repo
alias EctoJsonbExample.User
import Ecto.Query, only: [from: 2]

IO.puts "Select users with admin role"
query = from u in User,
        where: fragment("(settings_index->'roles')::jsonb \\? ?", "admin")

result = Repo.all(query)
IO.inspect result

IO.puts "Select users by acls"
query = from u in User,
        where: fragment("acls_index @> ?", ^[101])

roles_result = Repo.all(query)
IO.inspect roles_result

IO.puts "Select users by loyalty"
query = from u in User,
        where: fragment("(settings_index)::jsonb @> ?::jsonb", ^%{loyalties: 101})

result = Repo.all(query)
IO.inspect result

IO.puts "Select users - all with key personal_info"
query = from u in User,
        where: fragment("(settings_index)::jsonb \\? ?", "personal_info")

result = Repo.all(query)
IO.inspect result

IO.puts "Roles search benchmark with index vs without index"
index_role_query = fn ->
  query = from u in User,
          where: fragment("(settings_index->'roles')::jsonb \\? ?", "admin")
  Repo.all(query)
end

no_index_role_query = fn ->
  query = from u in User,
          where: fragment("(settings->'roles')::jsonb \\? ?", "admin")
  Repo.all(query)
end

Benchee.run(%{
  "with index"    => index_role_query,
  "without index" => no_index_role_query
}, time: 10)


