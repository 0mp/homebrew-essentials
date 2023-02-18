# Copyright (c) 2023 Mateusz Piotrowski <0mp@FreeBSD.org>
# SPDX-License-Identifier: BSD-2-Clause

class Goat < Formula
  desc "POSIX-compliant shell movement boosting hack for real ninjas"
  homepage "https://github.com/0mp/goat"
  url "https://github.com/0mp/goat/archive/refs/tags/v4.2.1.tar.gz"
  sha256 "498de829a7dd0af72129ddbd9c0771e37f1dbc482843a53e7e71fbc663e362c8"
  license "BSD-2-Clause"

  def install
    ENV["VERSION"] = version
    ENV["PREFIX"] = prefix
    system "make", "all", "install"
  end

  test do
    system "#{bin}/goat", "help"
  end
end
