# Copyright 2024 Mateusz Piotrowski <0mp@FreeBSD.org>
# SPDX-License-Identifier: BSD-2-Clause
class GitArc < Formula
  url_prefix = "https://cgit.freebsd.org/src/plain/tools/tools/git/"
  rev = "76a8625bc71da3fa63eef5abb4782553d2588f5c"
  url_suffix = "?id=" + rev

  desc "Wrapper to improve integration between git and arcanist"
  homepage "https://cgit.freebsd.org/src/plain/tools/tools/git/"
  url url_prefix + "git-arc.sh" + url_suffix
  license "BSD-2-Clause"
  sha256 "2125d0a57c522ab24a43091f851dbdd9b33633699eef84195c480630301335da"
  version "20240422" # Follows FreeBSD's devel/freebsd-git-devtools.

  depends_on "arcanist"
  depends_on "git"
  depends_on "jq"

  resource "manpage" do
    url url_prefix + "git-arc.1" + url_suffix
    sha256 "3b7660960d39bbe310194f985d5cbc08836cad249e29da0692dfe7945275dc8e"
  end

  def install
    bin.install "git-arc.sh" => "git-arc"
    resource("manpage").stage do
      man1.install "git-arc.1"
    end
  end
end
