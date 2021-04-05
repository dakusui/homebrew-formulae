# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Symfonion < Formula
  desc "SyMFONION is a language to compose music in JSON and render it into a midi file. Implemented in Java"
  homepage "http://dakusui.github.io/symfonion/"
  url "https://github.com/dakusui/symfonion/releases/download/v0.9.13/symfonion-0.9.13-release.zip"
  sha256 "0690c8b1a6ced52b18a03648df4fe03a9a92204a7adfa0843ddbf11a2b285954"
  license ""

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    mkdir_p "#{bin}"
    cp_r "./", "#{prefix}/"
    File.open("#{bin}/symfonion", "w") {|f| f.write("#!/bin/sh\njava -jar #{prefix}/symfonion.jar \"${@}\"") }
    chmod 0755, "#{bin}/symfonion"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test symfonion`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
