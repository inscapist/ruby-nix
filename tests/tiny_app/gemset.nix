{
  actioncable = {
    dependencies = ["actionpack" "activesupport" "nio4r" "websocket-driver"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1h1r4rx5bkhdbysf5rjma8mx927qpkrwzkqcxscd21pbvlc7vmn7";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  actionmailbox = {
    dependencies = ["actionpack" "activejob" "activerecord" "activestorage" "activesupport" "mail" "net-imap" "net-pop" "net-smtp"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kvqqvg0nw1ljzg9l5snr1z2lvp6yi7myprq4na6kiy2gvi2vwra";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  actionmailer = {
    dependencies = ["actionpack" "actionview" "activejob" "activesupport" "mail" "net-imap" "net-pop" "net-smtp" "rails-dom-testing"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "11jfwd9jq2dg1fdbnjisnjdgswrhji4nzay41hbrcyfp92ry8k7l";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  actionpack = {
    dependencies = ["actionview" "activesupport" "rack" "rack-test" "rails-dom-testing" "rails-html-sanitizer"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bh0nn9s302him8958qjw5vdcmi5557fl6px9zl3r4dpsa1vcpim";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  actiontext = {
    dependencies = ["actionpack" "activerecord" "activestorage" "activesupport" "globalid" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "04wq09csjicvyzixhkg4ijjfcwhg9jb7k5pr0vf816dmsinxsp0d";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  actionview = {
    dependencies = ["activesupport" "builder" "erubi" "rails-dom-testing" "rails-html-sanitizer"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "06zxdzxgrb0a9p61p41nz5jlrq01cspd6kq621i9hk1h96sj5rj5";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  activejob = {
    dependencies = ["activesupport" "globalid"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ib06afrnbh89hyia8hbs20pm6mmmpdnf6m2wqrvv4vgbmviay22";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  activemodel = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0wsaxvkggfx0w7yyhjkh3syyx6f2srby39asrg78cr90iiv5br3k";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  activerecord = {
    dependencies = ["activemodel" "activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07p5y382n15x5kywh4rkrxnyvqxm5mra58facrhdx258d8pbw1l4";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  activestorage = {
    dependencies = ["actionpack" "activejob" "activerecord" "activesupport" "marcel" "mini_mime"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "19xzlhwv2bbmb9528ldb52slfg1nn1x68ml49j22hc4896nm81dy";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  activesupport = {
    dependencies = ["concurrent-ruby" "i18n" "minitest" "tzinfo"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "183az13i4fsm28d0l5xhbjpmcj3l1lxzcxlx8pi8zrbd933jwqd0";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  addressable = {
    dependencies = ["public_suffix"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ypdmpdn20hxp5vwxz3zc04r5xcwqc25qszdlg41h8ghdqbllwmw";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.8.1";
  };
  apparition = {
    dependencies = ["capybara" "websocket-driver"];
    groups = ["default"];
    platforms = [];
    source = {
      fetchSubmodules = false;
      rev = "ca86be4d54af835d531dbcd2b86e7b2c77f85f34";
      sha256 = "00kkn98517cm6zc78r5i211wwjpixq5c4zzbmnd4rw46sdw9sm86";
      target = "ruby";
      type = "git";
      url = "https://github.com/twalpole/apparition.git";
    };
    targets = [];
    version = "0.6.0";
  };
  builder = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "045wzckxpwcqzrjr353cxnyaxgf0qg22jh00dcx7z38cys5g1jlr";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.2.4";
  };
  capybara = {
    dependencies = ["addressable" "matrix" "mini_mime" "nokogiri" "rack" "rack-test" "regexp_parser" "xpath"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "123198zk2ak8mziwa5jc3ckgpmsg08zn064n3aywnqm9s1bwjv3v";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.38.0";
  };
  concurrent-ruby = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qnsflsbjj38im8xq35g0vihlz96h09wjn2dad5g543l3vvrkrx5";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.2.0";
  };
  crass = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pfl5c0pyqaparxaqxi6s4gfl21bdldwiawrc0aknyvflli60lfw";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.6";
  };
  date = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "03skfikihpx37rc27vr3hwrb057gxnmdzxhmzd4bf4jpkl0r55w1";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.3.3";
  };
  debug = {
    dependencies = ["irb" "reline"];
    groups = ["development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hkzdyh2l4rb1f8l1pvxmcbivkl71lgzm44834z87r93drpnxg6r";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.7.1";
  };
  erubi = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08s75vs9cxlc4r1q2bjg4br8g9wc5lc5x5vl0vv4zq5ivxsdpgi7";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.12.0";
  };
  globalid = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "040bxzfd7mz1p6z4bc9vk5yrf762hdllvf98hmk848fq28xc5dsk";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.1";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vdcchz7jli1p0gnc669a7bj3q1fv09y9ppf0y3k0vb1jwdwrqwi";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.12.0";
  };
  io-console = {
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dikardh14c72gd9ypwh8dim41wvqmzfzf35mincaj5yals9m7ff";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.6.0";
  };
  irb = {
    dependencies = ["reline"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10qvm0s8784lhmz98blqnxh36i7d7rzkk17znx17d46666z7czrf";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.6.2";
  };
  loofah = {
    dependencies = ["crass" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08qhzck271anrx9y6qa6mh8hwwdzsgwld8q0000rcd7yvvpnjr3c";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.19.1";
  };
  mail = {
    dependencies = ["mini_mime" "net-imap" "net-pop" "net-smtp"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0n0pijrc465zzrv5flxc41375zwaz9yfc2n0r80zjwarc1ixkdx1";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.8.0.1";
  };
  marcel = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kky3yiwagsk8gfbzn3mvl2fxlh3b39v6nawzm4wpjs6xxvvc4x0";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.2";
  };
  matrix = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1h2cgkpzkh3dd0flnnwfq6f3nl2b1zff9lvqz8xs853ssv5kq23i";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.4.2";
  };
  method_source = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pnyh44qycnf9mzi1j6fywd5fkskv3x7nmsqrrws0rjn5dd4ayfp";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.0.0";
  };
  mini_mime = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0lbim375gw2dk6383qirz13hgdmxlan0vc5da2l072j3qw6fqjm5";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.1.2";
  };
  minitest = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kjy67qajw4rnkbjs5jyk7kc3lyhz5613fwj1i8f6ppdk4zampy0";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "5.17.0";
  };
  net-imap = {
    dependencies = ["date" "net-protocol"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1d996zf3g8xz244791b0qsl9vr7zg4lqnnmf9k2kshr9lki5jam8";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.4";
  };
  net-pop = {
    dependencies = ["net-protocol"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1wyz41jd4zpjn0v1xsf9j778qx1vfrl24yc20cpmph8k42c4x2w4";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.1.2";
  };
  net-protocol = {
    dependencies = ["timeout"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dxckrlw4q1lcn3qg4mimmjazmg9bma5gllv72f8js3p36fb3b91";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.2.1";
  };
  net-smtp = {
    dependencies = ["net-protocol"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1c6md06hm5bf6rv53sk54dl2vg038pg8kglwv3rayx0vk2mdql9x";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.3";
  };
  nio4r = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xk64wghkscs6bv2n22853k2nh39d131c6rfpnlw12mbjnnv9v1v";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.5.8";
  };
  nokogiri = {
    dependencies = ["racc"];
    groups = ["default"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "1gigymg0r84ll6479valykcvixbixfw7xqn640samba6r8mqpa7s";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "1.14.0";
  };
  phony_gem = {
    groups = ["default"];
    platforms = [];
    source = {
      path = "lib/phony_gem";
      target = "ruby";
      type = "path";
    };
    targets = [];
    version = "0.1.0";
  };
  public_suffix = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hz0bx2qs2pwb0bwazzsah03ilpf3aai8b7lk7s35jsfzwbkjq35";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "5.0.1";
  };
  puma = {
    dependencies = ["nio4r"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qzq0c791kacv68hgk9zqsd1p7zx1y1rr9j10rn9yphibb8jj436";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "5.6.5";
  };
  racc = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "09jgz6r0f7v84a7jz9an85q8vvmp743dqcsdm3z9c8rqcqv6pljq";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.6.2";
  };
  rack = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qvp6h2abmlsl4sqjsvac03cr2mxq6143gbx4kq52rpazp021qsb";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.2.6.2";
  };
  rack-test = {
    dependencies = ["rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rjl709krgf499dhjdapg580l2qaj9d91pwzk8ck8fpnazlx1bdd";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.0.2";
  };
  rails = {
    dependencies = ["actioncable" "actionmailbox" "actionmailer" "actionpack" "actiontext" "actionview" "activejob" "activemodel" "activerecord" "activestorage" "activesupport" "railties"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0cazgy9n2wqm17y5iqnhk9g8r18im2mjd14pxsxb8i6yayzdmlp1";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  rails-dom-testing = {
    dependencies = ["activesupport" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lfq2a7kp2x64dzzi5p4cjcbiv62vxh9lyqk2f0rqq3fkzrw8h5i";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.0.3";
  };
  rails-html-sanitizer = {
    dependencies = ["loofah"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1mcb75qvldfz6zsr4inrfx7dmb0ngxy507awx28khqmnla3hqpc9";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.4.4";
  };
  railties = {
    dependencies = ["actionpack" "activesupport" "method_source" "rake" "thor" "zeitwerk"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yngm4hzax2sdx70k97qmvps32h0z1nv8xh4slr2632ilsqa65aj";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "7.0.4";
  };
  rake = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15whn7p9nrkxangbs9hh75q585yfn66lv0v2mhj6q6dl6x8bzr2w";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "13.0.6";
  };
  regexp_parser = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rj7xcg7bkfw6y0h4wg8y3s4nmks9qrzdxag4zaw41xjqfanlysf";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.6.1";
  };
  reline = {
    dependencies = ["io-console"];
    groups = ["default" "development" "test"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1vpsmij5mknpiqy4b835rzl87slshm5dkr08hm8wypfya3v4m6cp";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.2";
  };
  sprockets = {
    dependencies = ["concurrent-ruby" "rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0k0236g4h3ax7v6vp9k0l2fa0w6f1wqp7dn060zm4isw4n3k89sw";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "4.2.0";
  };
  sprockets-rails = {
    dependencies = ["actionpack" "activesupport" "sprockets"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1b9i14qb27zs56hlcc2hf139l0ghbqnjpmfi0054dxycaxvk5min";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.4.2";
  };
  sqlite3 = {
    groups = ["default"];
    platforms = [];
    source = null;
    targets = [{
      remotes = ["https://rubygems.org"];
      sha256 = "129g2mjrfpa71298q72s0fiyssf9pv5nicdipv8ijjks50wiba98";
      target = "x86_64-linux";
      targetCPU = "x86_64";
      targetOS = "linux";
      type = "gem";
    }];
    version = "1.5.4";
  };
  thor = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0inl77jh4ia03jw3iqm5ipr76ghal3hyjrd6r8zqsswwvi9j2xdi";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.2.1";
  };
  timeout = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0lnh0kr7f43m1cjzc2jvggfsl1rzsaj2rd3pn6vp7mcqliymzaza";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.3.1";
  };
  tzinfo = {
    dependencies = ["concurrent-ruby"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rx114mpqnw2k4h98vc0rs0x0bmf0img84yh8mkkjkal07cjydf5";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.0.5";
  };
  tzinfo-data = {
    dependencies = ["tzinfo"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0drm9pygji01pyimxq65ngdvgpn228g7fhffmrqw0xn7l2rdhclp";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "1.2022.7";
  };
  websocket-driver = {
    dependencies = ["websocket-extensions"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0a3bwxd9v3ghrxzjc4vxmf4xa18c6m4xqy5wb0yk5c6b9psc7052";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.7.5";
  };
  websocket-extensions = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0hc2g9qps8lmhibl5baa91b4qx8wqw872rgwagml78ydj8qacsqw";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "0.1.5";
  };
  xpath = {
    dependencies = ["nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bh8lk9hvlpn7vmi6h4hkcwjzvs2y0cmkk3yjjdr8fxvj6fsgzbd";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "3.2.0";
  };
  zeitwerk = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "09pqhdi6q4sqv0p1gnjpbcy4az0yv8hrpykjngdgh9qiqd87nfdv";
      target = "ruby";
      type = "gem";
    };
    targets = [];
    version = "2.6.6";
  };
}