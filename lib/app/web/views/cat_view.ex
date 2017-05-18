defmodule App.Web.CatView do
  use App.Web, :view
  alias App.Web.CatView

  def render("index.json", %{cats: cats}) do
    %{data: render_many(cats, CatView, "cat.json")}
  end

  def render("show.json", %{cat: cat}) do
    %{data: render_one(cat, CatView, "cat.json")}
  end

  def render("cat.json", %{cat: cat}) do
    %{id: cat.id,
      name: cat.name,
      surname: cat.surname,
      destroyed_couch_count: cat.destroyed_couch_count}
  end
end
