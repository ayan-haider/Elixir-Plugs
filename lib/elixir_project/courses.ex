defmodule ElixirProject.Courses do
  use Ecto.Schema

  schema "courses" do
    field(:title, :string)
    field(:author, :string)
    field(:free, :boolean)
    field(:overview, :string)
    field(:img, :string)
    field(:url, :string)
  end

  def changeset(course, attrs) do
    course
    |> Ecto.Changeset.cast(attrs, [:title, :author, :free, :overview, :img, :url])
    |> Ecto.Changeset.validate_required([:title, :author, :free, :overview, :img, :url])
  end
end
