{
  ast = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04nc8x27hlzlrr5c2gn7mar4vdr0apw5xg22wp6m8dx3wqr04a0y";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "2.4.2";
  };
  debug = {
    dependencies = ["irb" "reline"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hkzdyh2l4rb1f8l1pvxmcbivkl71lgzm44834z87r93drpnxg6r";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "1.7.1";
  };
  diff-lcs = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rwvjahnp7cpmracd8x732rjgnilqv2sx7d1gfrysslc3h039fa9";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "1.5.0";
  };
  google-protobuf = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dcgkhjiaxha3yznyxxzm8a4n4jf61rk7kgbxy4sdkb865zbn2ab";
      target = "ruby";
      type = "gem";
    };
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "0x1mj6r87qvhv0zvyaaj3xj65qx4hjz0hvdrgzb0yl8f0k8rprfp";
      target = "x86_64-darwin";
      targetCPU = "x86_64";
      targetOS = "darwin";
      type = "gem";
    } {
      remotes = ["https://rubygems.org"];
      sha256 = "1q1xvgamwmq2smwj2nj3h7npbmikp24rddp6l4nf21vqijk20s6b";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "3.21.12";
  };
  googleapis-common-protos-types = {
    dependencies = ["google-protobuf"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12w5bwaziz2iqb9dvgnskp2a7ifml6n4lyl9ypvnxj5bfrrwysap";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "1.5.0";
  };
  grpc = {
    dependencies = ["google-protobuf" "googleapis-common-protos-types"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p7vqhfqp3xhs0lf16w23rzllnz0bibvz8falx8bpcpfgqlkkr2m";
      target = "ruby";
      type = "gem";
    };
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "0q7mczk3nyc643bh72zjyk998zg13h2fhd4a8cf08263819wqir4";
      target = "x86_64-darwin";
      targetCPU = "x86_64";
      targetOS = "darwin";
      type = "gem";
    } {
      remotes = ["https://rubygems.org"];
      sha256 = "1fmfbliqc4ixqrsji9qdiy46f44fj0snj2yhqni1rh16nyngzgrv";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "1.50.0";
  };
  io-console = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dikardh14c72gd9ypwh8dim41wvqmzfzf35mincaj5yals9m7ff";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "0.6.0";
  };
  irb = {
    dependencies = ["reline"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10qvm0s8784lhmz98blqnxh36i7d7rzkk17znx17d46666z7czrf";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "1.6.2";
  };
  mini_portile2 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1af4yarhbbx62f7qsmgg5fynrik0s36wjy3difkawy536xg343mp";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.8.1";
  };
  netrc = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gzfmcywp1da8nzfqsql2zqi648mfnx6qwkig3cv36n9m0yy676y";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "0.11.0";
  };
  nokogiri = {
    dependencies = ["mini_portile2" "racc"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1fqld4wnamj7awdr1lwdifpylqdrrg5adm8xj2jl9sc5ms3nxjjm";
      target = "ruby";
      type = "gem";
    };
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "06nvgaw9nkkd368mcrnspwvxlgdz1sv97fmawbkjc5ahp3pd832w";
      target = "arm64-darwin";
      targetCPU = "arm64";
      targetOS = "darwin";
      type = "gem";
    } {
      remotes = ["https://rubygems.org"];
      sha256 = "15cbvakvxz5vvz48wmqh9innij8lj0pjic3mdji3fvsz1h6qqcjx";
      target = "x86_64-darwin";
      targetCPU = "x86_64";
      targetOS = "darwin";
      type = "gem";
    } {
      remotes = ["https://rubygems.org"];
      sha256 = "1gigymg0r84ll6479valykcvixbixfw7xqn640samba6r8mqpa7s";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "1.14.0";
  };
  parallel = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07vnk6bb54k4yc06xnwck7php50l09vvlw1ga8wdz0pia461zpzb";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "1.22.1";
  };
  parser = {
    dependencies = ["ast"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0zk8mdyr0322r11d63rcp5jhz4lakxilhvyvdv0ql5dw4lb83623";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "3.2.0.0";
  };
  racc = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "09jgz6r0f7v84a7jz9an85q8vvmp743dqcsdm3z9c8rqcqv6pljq";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "1.6.2";
  };
  rbi = {
    dependencies = ["ast" "parser" "sorbet-runtime" "unparser"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jiz3hd9vqb004vvj0s0dyhxd10lnh2hzhmnkh9ls4y64ki2j10x";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "0.0.16";
  };
  reline = {
    dependencies = ["io-console"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vpsmij5mknpiqy4b835rzl87slshm5dkr08hm8wypfya3v4m6cp";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "0.3.2";
  };
  sorbet = {
    dependencies = ["sorbet-static"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ni28dcgkp2vmzx4hy6qqbrh7s6p38i7kj5dm3gl0qwi3vb6qi3b";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "0.5.10624";
  };
  sorbet-runtime = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g6alj94vdca44qvm992nhqsccdxskir8gav6f9kfqg2mcjm6n44";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "0.5.10624";
  };
  sorbet-static = {
    groups = ["default" "development"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "0pz8cmpw5yzq1j827cd2v6skkwgy2gp4qki75gydyrm4xgfv9v4x";
      target = "universal-darwin-20";
      targetCPU = "universal";
      targetOS = "darwin";
      type = "gem";
    } {
      remotes = ["https://rubygems.org"];
      sha256 = "0rcq3g2z4wqx8k3nckhhy5h1hw43c83jzcvqgsajg5sz6l367z85";
      target = "universal-darwin-21";
      targetCPU = "universal";
      targetOS = "darwin";
      type = "gem";
    } {
      remotes = ["https://rubygems.org"];
      sha256 = "1jnyky2m5nw7ilrl0gjsss1qi24q5ncv7wmw3by1qv33lgg8hq5i";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "0.5.10624";
  };
  sorbet-static-and-runtime = {
    dependencies = ["sorbet" "sorbet-runtime"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "042hvqh322pgpw5f5b5ys4f0md6bwgmb2al5aplm33nw80s9m7sk";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "0.5.10624";
  };
  spoom = {
    dependencies = ["sorbet" "sorbet-runtime" "thor"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gh5hl2dpmdsh90p515dm60rxawh5y9jv3fry6dsgdizikrcq8pd";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "1.1.15";
  };
  tapioca = {
    dependencies = ["netrc" "parallel" "rbi" "sorbet-static-and-runtime" "spoom" "thor" "yard-sorbet"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qrrsw2vp2mglaf3974vw9znpqmic71681hakcg0f4x6a7qzl29w";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "0.10.5";
  };
  thor = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0inl77jh4ia03jw3iqm5ipr76ghal3hyjrd6r8zqsswwvi9j2xdi";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "1.2.1";
  };
  unparser = {
    dependencies = ["diff-lcs" "parser"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1j6ym6cn43ry4lvcal7cv0n9g9awny7kcrn1crp7cwx2vwzffhmf";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "0.6.7";
  };
  webrick = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d4cvgmxhfczxiq5fr534lmizkhigd15bsx5719r5ds7k7ivisc7";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "1.7.0";
  };
  yard = {
    dependencies = ["webrick"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p1if8g9ww6hlpfkphqv3y1z0rbqnnrvb38c5qhnala0f8qpw6yk";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "0.9.28";
  };
  yard-sorbet = {
    dependencies = ["sorbet-runtime" "yard"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0idmxrlpbja9b4gnrn6iipw2kiw6jkx6bhqd1zc93w210mraznpa";
      target = null;
      type = "gem";
    };
    targets = [];
    version = "0.7.0";
  };
}