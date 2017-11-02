defmodule EctoJsonbExample.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    create table("users") do
      add(:name, :string, null: false)
      add(:settings, :jsonb, null: false, default: "{}")
      add(:settings_index, :jsonb, null: false, default: "{}")
      add(:acls, :jsonb, null: false, default: "[]")
      add(:acls_index, :jsonb, null: false, default: "[]")
    end

    execute(
      "CREATE INDEX users_settings_index_providers ON users USING GIN ((settings_index->'providers'))"
    )

    execute(
      "CREATE INDEX users_settings_index_roles ON users USING GIN ((settings_index->'roles'))"
    )

    execute("CREATE INDEX users_acls_index ON users USING GIN ((acls_index))")
  end
end
