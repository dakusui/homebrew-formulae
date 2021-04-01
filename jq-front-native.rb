# coding: utf-8
# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class JqFrontNative < Formula
  desc "A tool to empower your JSON"
  homepage "https://dakusui.github.io/jq-front/"
  url "https://codeload.github.com/dakusui/jq-front/tar.gz/refs/tags/v0.43"
  sha256 "3d577c80a5c17295700b91f4128c4a8c46282151a72bb329705beec102bf7105"
  license "MIT"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    #system "mkdir", "#{prefix}/jq-front"
    #    system "cp", "-r", "./", "#{prefix}/jq-front/"
    # system "ln",  "-s", "#{prefix}/jq-front", "#{bin}/jq-front"
    system  "echo", "#{prefix}
    mkdir_p "#{prefix}"
    rm_f "./bin/yq"
    cp_r ".", "#{prefix}/"
    ln_s "#{prefix}/jq-front", "#{prefix}/bin/jq-front-native"
  end

  test do
    system "pwd"
    system "ls", "-al", "#{prefix}/"
  end
end
