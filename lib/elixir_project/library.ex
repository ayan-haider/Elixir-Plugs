defmodule ElixirProject.Library do
  import Ecto.Query
  alias ElixirProject.Repo

  def get_records() do
    courses = Repo.all from(row in ElixirProject.Courses, select: %{title: row.title, author: row.author, free: row.free, overview: row.overview, img: row.img, url: row.url})
    courses
  end

  def search_records(search) do
    search = "%"<>search<>"%"
    results = Repo.all from(row in ElixirProject.Courses, select: %{title: row.title, author: row.author, free: row.free, overview: row.overview, img: row.img, url: row.url}, where: ilike(row.title, ^search) or ilike(row.author, ^search))
    results
  end
end
