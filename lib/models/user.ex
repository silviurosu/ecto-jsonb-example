defmodule EctoJsonbExample.User do
  use Ecto.Schema

  schema "users" do
    field :name, :string
    field :settings, :map
    field :settings_index, :map
    field :acls, {:array, :integer}
    field :acls_index, {:array, :integer}
  end
end
