alias EctoJsonbExample.Repo
alias EctoJsonbExample.User

roles = ["user", "driver", "manager", "support", "technician", "guest"]
providers = ["facebook", "google", "twitter", "github", "foursquare", "dropbox", "linkedin", "vimeo"]

for i <- 1..1_000_000 do
  selected_providers = Enum.take_random(providers, 2)
  selected_roles = Enum.take_random(roles, 2)
  settings = %{
    roles: (if rem(i, 250_000) == 0, do: ["admin", Enum.random(selected_roles)], else: selected_roles),
    loyalties: :rand.uniform(1_000),
    providers: selected_providers
  }

  acls = for _ <- 1..4, do: :rand.uniform(100)
  acls = if rem(i, 250_000) == 0, do: acls ++ [101], else: acls


  Repo.insert! %User{
    name: Faker.Name.name,
    settings: settings,
    settings_index: settings,
    acls: acls,
    acls_index: acls
  }
  IO.puts "inserting user #{i}/1_000_000"
end
