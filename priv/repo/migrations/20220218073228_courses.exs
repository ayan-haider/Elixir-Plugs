defmodule ElixirProject.Repo.Migrations.Courses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add(:title, :string)
      add(:author, :string)
      add(:free, :boolean)
      add(:overview, :string, size: 1024)
      add(:img, :string)
      add(:url, :string)
    end
  end
end
