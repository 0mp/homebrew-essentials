# SPDX-FileCopyrightText: 2024-2026 Mateusz Piotrowski <0mp@FreeBSD.org>
# SPDX-License-Identifier: BSD-2-Clause
class Arcanist < Formula
  desc "Command-line interface for Phabricator (Phorge.it Fork)"
  homepage "https://www.phabricator.com/docs/arcanist/"
  url "https://github.com/phorgeit/arcanist/archive/refs/tags/2026.27.tar.gz"
  sha256 "e3e6561a611a900be8fa8241e86139683a5b5ceec37e4496034876fe8f809ad9"
  license "Apache-2.0"

  depends_on "php"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script (libexec/"bin/arc")
  end

  test do
    system bin/"arc", "version"
  end
end
