# Copyright (c) 2023 Mateusz Piotrowski <0mp@FreeBSD.org>
# SPDX-License-Identifier: BSD-2-Clause

class Mantra < Formula
  desc "CLI for live preview of mandoc manual pages for documentation contributors"
  homepage "https://github.com/0mp/mantra"
  url "https://github.com/0mp/mantra/archive/refs/tags/0.1.2.tar.gz"
  sha256 "a8debdec0af362e7d1f05f9d9753686a564adf79cfa2f85981b38e4ca59f2856"
  license "BSD-2-Clause"

  depends_on "entr"
  depends_on "tmux"
  uses_from_macos "less"

  def install
    ENV["VERSION"] = version
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/mantra", "-h"
  end
end
