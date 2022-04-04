defmodule PostTest do
  use DataCase

  test "tags are an non-empty array after insert" do
    assert %Post{tags: ["popular", "new"]} =
             %Post{}
             |> Post.changeset(%{tags: ["popular", "new"]})
             |> Repo.insert!()
  end

  test "tags are an empty array after insert" do
    assert %Post{tags: []} =
             %Post{}
             |> Post.changeset()
             |> Repo.insert!()
  end
end
