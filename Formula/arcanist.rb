# Copyright (c) 2024 Mateusz Piotrowski <0mp@FreeBSD.org>
# SPDX-License-Identifier: BSD-2-Clause
class Arcanist < Formula
  desc "Command line interface for Phabricator"
  homepage "http://www.phabricator.com/docs/arcanist/"
  url "https://github.com/phacility/arcanist/archive/e50d1bc4eabac9c37e3220e9f3fb8e37ae20b957.tar.gz"
  sha256 "acd8a30ff7e4a3fd8f9868ca357d05e377f9fade1c2dcedd824307a892bef2bb"
  license "Apache-2.0"

  depends_on "php"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script (libexec/"bin/arc")
  end
end
