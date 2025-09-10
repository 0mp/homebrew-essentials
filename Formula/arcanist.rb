# Copyright (c) 2024-2025 Mateusz Piotrowski <0mp@FreeBSD.org>
# SPDX-License-Identifier: BSD-2-Clause
class Arcanist < Formula
  desc "Command-line interface for Phabricator (Phorge.it Fork)"
  homepage "https://www.phabricator.com/docs/arcanist/"
  url "https://github.com/phorgeit/arcanist/archive/d2d2afd0bea97e5f68742b0e25b40ae1a9096d41.tar.gz"
  sha256 "265e3c86b5a6bbfec3bf9ac06b3f1e207e2d1044bf191f0864e4df6d8b4b4801"
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
