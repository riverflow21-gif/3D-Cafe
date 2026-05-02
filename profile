<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>3D Cafe Poris — Craft Coffee & Cozy Space</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.iconify.design/3/3.1.0/iconify.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <style>
        *{margin:0;padding:0;box-sizing:border-box}
        body{font-family:'Inter',sans-serif;background:#09090b;color:#fff;overflow-x:hidden}
        ::-webkit-scrollbar{width:6px}::-webkit-scrollbar-track{background:#09090b}::-webkit-scrollbar-thumb{background:#6366f1;border-radius:3px}
        html{scroll-behavior:smooth}
        @keyframes fadeInUp{from{opacity:0;transform:translateY(30px)}to{opacity:1;transform:translateY(0)}}
        @keyframes float{0%,100%{transform:translateY(0)}50%{transform:translateY(-10px)}}
        @keyframes pulse-glow{0%,100%{box-shadow:0 0 20px rgba(99,102,241,0.1)}50%{box-shadow:0 0 40px rgba(99,102,241,0.25)}}
        @keyframes grain{0%,100%{transform:translate(0,0)}10%{transform:translate(-5%,-10%)}50%{transform:translate(12%,9)}90%{transform:translate(-1%,7%)}}
        @keyframes shimmer{0%{background-position:-200% 0}100%{background-position:200% 0}}
        @keyframes marquee{0%{transform:translateX(0)}100%{transform:translateX(-50%)}}
        @keyframes spin-slow{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
        @keyframes blob{0%,100%{border-radius:60% 40% 30% 70%/60% 30% 70% 40%}50%{border-radius:30% 60% 70% 40%/50% 60% 30% 60%}}
        @keyframes waveFloat{0%,100%{transform:translateY(0) translateX(0)}25%{transform:translateY(-5px) translateX(3px)}75%{transform:translateY(-5px) translateX(-3px)}}
        @keyframes borderGlow{0%,100%{border-color:rgba(99,102,241,0.2)}50%{border-color:rgba(217,70,239,0.3)}}
        @keyframes shake{0%,100%{transform:translateX(0)}20%,60%{transform:translateX(-8px)}40%,80%{transform:translateX(8px)}}
        @keyframes eqBar1{0%,100%{height:4px}50%{height:16px}}
        @keyframes eqBar2{0%,100%{height:8px}50%{height:20px}}
        @keyframes eqBar3{0%,100%{height:6px}50%{height:14px}}
        @keyframes eqBar4{0%,100%{height:10px}50%{height:18px}}
        .eq-bar{width:3px;border-radius:2px;background:linear-gradient(to top,#6366f1,#d946ef);transition:height .1s}
        .eq-playing .eq-bar:nth-child(1){animation:eqBar1 .6s ease-in-out infinite}
        .eq-playing .eq-bar:nth-child(2){animation:eqBar2 .5s ease-in-out infinite .1s}
        .eq-playing .eq-bar:nth-child(3){animation:eqBar3 .7s ease-in-out infinite .05s}
        .eq-playing .eq-bar:nth-child(4){animation:eqBar4 .55s ease-in-out infinite .15s}
        .eq-paused .eq-bar{height:3px!important;animation:none!important}
        .music-panel{position:fixed;bottom:80px;left:24px;z-index:45;transform:translateY(20px);opacity:0;pointer-events:none;transition:all .4s cubic-bezier(.16,1,.3,1)}
        .music-panel.open{transform:translateY(0);opacity:1;pointer-events:auto}
        .vol-slider{-webkit-appearance:none;width:100%;height:4px;border-radius:2px;background:rgba(255,255,255,.1);outline:none}
        .vol-slider::-webkit-slider-thumb{-webkit-appearance:none;width:14px;height:14px;border-radius:50%;background:linear-gradient(135deg,#6366f1,#d946ef);cursor:pointer;box-shadow:0 0 8px rgba(99,102,241,.4)}
        .vol-slider::-moz-range-thumb{width:14px;height:14px;border-radius:50%;background:linear-gradient(135deg,#6366f1,#d946ef);cursor:pointer;border:none}
        .grain-overlay::before{content:'';position:fixed;top:-50%;left:-50%;width:200%;height:200%;background-image:url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");animation:grain 8s steps(10) infinite;pointer-events:none;z-index:9999;opacity:.4}
        .animate-on-scroll{opacity:0;transform:translateY(30px);transition:all .8s cubic-bezier(.16,1,.3,1)}
        .animate-on-scroll.visible{opacity:1;transform:translateY(0)}
        .d1{transition-delay:.1s}.d2{transition-delay:.2s}.d3{transition-delay:.3s}.d4{transition-delay:.4s}.d5{transition-delay:.5s}
        .hero-title{animation:fadeInUp .8s cubic-bezier(.16,1,.3,1) forwards}
        .hero-sub{animation:fadeInUp .8s cubic-bezier(.16,1,.3,1) .15s forwards;opacity:0}
        .hero-cta{animation:fadeInUp .8s cubic-bezier(.16,1,.3,1) .3s forwards;opacity:0}
        .hero-badge{animation:fadeInUp .8s cubic-bezier(.16,1,.3,1) .05s forwards;opacity:0}
        .glass{background:rgba(255,255,255,.03);backdrop-filter:blur(12px);border:1px solid rgba(255,255,255,.06)}
        .glass-strong{background:rgba(255,255,255,.05);backdrop-filter:blur(20px);border:1px solid rgba(255,255,255,.08)}
        .menu-card{transition:all .5s cubic-bezier(.16,1,.3,1)}.menu-card:hover{transform:translateY(-4px);background:rgba(255,255,255,.06)}
        .menu-card:hover .menu-img{transform:scale(1.08)}.menu-card .menu-img{transition:transform .6s cubic-bezier(.16,1,.3,1)}
        .gallery-item{transition:all .5s cubic-bezier(.16,1,.3,1)}.gallery-item:hover{transform:scale(1.02)}
        .gallery-item:hover .gallery-overlay{opacity:1}.gallery-overlay{transition:opacity .4s ease}
        .nav-link{position:relative;transition:color .3s}.nav-link::after{content:'';position:absolute;bottom:-4px;left:0;width:0;height:1px;background:linear-gradient(to right,#6366f1,#d946ef);transition:width .3s}.nav-link:hover{color:#fff}.nav-link:hover::after{width:100%}
        .btn-primary{background:#fff;color:#000;transition:all .3s;box-shadow:0 0 20px rgba(255,255,255,.1)}.btn-primary:hover{box-shadow:0 0 30px rgba(255,255,255,.2);transform:scale(1.02)}
        .btn-outline{border:1px solid rgba(255,255,255,.15);color:#fff;transition:all .3s}.btn-outline:hover{border-color:rgba(255,255,255,.3);background:rgba(255,255,255,.05)}
        .cat-btn{transition:all .3s}.cat-btn.active{background:rgba(99,102,241,.15);color:#818cf8;border-color:rgba(99,102,241,.3)}
        .testimonial-card{transition:all .5s cubic-bezier(.16,1,.3,1)}.testimonial-card:hover{transform:translateY(-2px);background:rgba(255,255,255,.05)}
        .mobile-menu{transform:translateX(100%);transition:transform .4s cubic-bezier(.16,1,.3,1)}.mobile-menu.open{transform:translateX(0)}
        .divider{height:1px;background:linear-gradient(to right,transparent,rgba(255,255,255,.08),transparent)}
        .float-1{animation:float 6s ease-in-out infinite}.float-2{animation:float 6s ease-in-out 1s infinite}.float-3{animation:float 6s ease-in-out 2s infinite}
        .toast{position:fixed;bottom:30px;left:50%;transform:translateX(-50%) translateY(100px);z-index:10000;transition:transform .5s cubic-bezier(.16,1,.3,1),opacity .5s;opacity:0;pointer-events:none}
        .toast.show{transform:translateX(-50%) translateY(0);opacity:1;pointer-events:auto}
        .menu-list-item{transition:all .3s;border-bottom:1px solid rgba(255,255,255,.04)}.menu-list-item:hover{background:rgba(255,255,255,.03);padding-left:20px}.menu-list-item:last-child{border-bottom:none}
        .logo-3d{font-weight:700;font-size:18px;letter-spacing:-.5px;background:linear-gradient(135deg,#a5b4fc,#fff,#c084fc);-webkit-background-clip:text;-webkit-text-fill-color:transparent;position:relative}
        .logo-3d::after{content:'3D';position:absolute;left:0;top:0;background:linear-gradient(135deg,rgba(99,102,241,.3),rgba(217,70,239,.3));-webkit-background-clip:text;-webkit-text-fill-color:transparent;filter:blur(8px);z-index:-1}
        .price-tag{font-family:'JetBrains Mono',monospace;font-size:13px;color:#818cf8}
        .category-header{position:relative;padding-left:16px}.category-header::before{content:'';position:absolute;left:0;top:50%;transform:translateY(-50%);width:4px;height:20px;border-radius:2px;background:linear-gradient(to bottom,#6366f1,#d946ef)}
        .star-badge{background:linear-gradient(135deg,rgba(245,158,11,.15),rgba(239,68,68,.1));border:1px solid rgba(245,158,11,.2)}
        .marquee-track{display:flex;animation:marquee 30s linear infinite;width:max-content}.marquee-track:hover{animation-play-state:paused}
        .deco-blob{animation:blob 8s ease-in-out infinite;opacity:.04}.deco-ring{animation:spin-slow 20s linear infinite}
        .deco-dots{background-image:radial-gradient(rgba(255,255,255,.08) 1px,transparent 1px);background-size:20px 20px}
        .stat-number{font-variant-numeric:tabular-nums}
        .corner-accent{position:absolute;width:40px;height:40px;opacity:.1}
        .corner-accent::before,.corner-accent::after{content:'';position:absolute;background:linear-gradient(to right,#6366f1,#d946ef)}
        .corner-tl::before{top:0;left:0;width:20px;height:1px}.corner-tl::after{top:0;left:0;width:1px;height:20px}
        .corner-br::before{bottom:0;right:0;width:20px;height:1px}.corner-br::after{bottom:0;right:0;width:1px;height:20px}
        .section-deco{display:flex;align-items:center;gap:12px;justify-content:center;margin-bottom:48px}
        .section-deco .line{width:60px;height:1px;background:linear-gradient(to right,transparent,rgba(99,102,241,.3))}
        .section-deco .diamond{width:6px;height:6px;transform:rotate(45deg);background:linear-gradient(135deg,#6366f1,#d946ef);opacity:.5}
        .settings-panel{position:fixed;top:0;right:0;width:440px;max-width:100vw;height:100vh;background:rgba(9,9,11,.98);backdrop-filter:blur(30px);border-left:1px solid rgba(255,255,255,.08);z-index:10001;transform:translateX(100%);transition:transform .4s cubic-bezier(.16,1,.3,1);overflow-y:auto}
        .settings-panel.open{transform:translateX(0)}.settings-panel::-webkit-scrollbar{width:4px}.settings-panel::-webkit-scrollbar-thumb{background:#333;border-radius:2px}
        .settings-overlay{position:fixed;inset:0;background:rgba(0,0,0,.6);z-index:10000;opacity:0;pointer-events:none;transition:opacity .3s}.settings-overlay.open{opacity:1;pointer-events:auto}
        .img-slot{transition:all .3s;border:1px solid rgba(255,255,255,.06);border-radius:12px;overflow:hidden}.img-slot:hover{border-color:rgba(99,102,241,.3)}
        .img-slot input,.text-edit-input,.text-edit-area{background:rgba(255,255,255,.03);border:1px solid rgba(255,255,255,.08);border-radius:8px;padding:8px 12px;color:#fff;font-size:12px;width:100%;outline:none;font-family:'Inter',sans-serif;transition:border-color .3s}
        .img-slot input:focus,.text-edit-input:focus,.text-edit-area:focus{border-color:rgba(99,102,241,.5)}
        .img-slot input::placeholder,.text-edit-input::placeholder,.text-edit-area::placeholder{color:#52525b}
        .img-preview{width:100%;aspect-ratio:16/10;object-fit:cover;border-radius:8px;background:rgba(255,255,255,.03)}
        .img-preview-square{width:100%;aspect-ratio:1;object-fit:cover;border-radius:8px;background:rgba(255,255,255,.03)}
        .img-preview-tall{width:100%;aspect-ratio:3/4;object-fit:cover;border-radius:8px;background:rgba(255,255,255,.03)}
        .reset-btn{transition:all .3s}.reset-btn:hover{background:rgba(239,68,68,.15);border-color:rgba(239,68,68,.3);color:#f87171}
        .pw-modal{position:fixed;inset:0;z-index:10002;display:flex;align-items:center;justify-content:center;background:rgba(0,0,0,.7);backdrop-filter:blur(10px);opacity:0;pointer-events:none;transition:opacity .3s}
        .pw-modal.open{opacity:1;pointer-events:auto}
        .pw-modal .modal-box{transform:scale(.9);transition:transform .4s cubic-bezier(.16,1,.3,1)}.pw-modal.open .modal-box{transform:scale(1)}
        .pw-input{background:rgba(255,255,255,.05);border:1px solid rgba(255,255,255,.1);border-radius:12px;padding:14px 18px;color:#fff;font-size:14px;width:100%;outline:none;font-family:'Inter',sans-serif;letter-spacing:2px;text-align:center;transition:all .3s}
        .pw-input:focus{border-color:rgba(99,102,241,.5);box-shadow:0 0 20px rgba(99,102,241,.1)}
        .pw-input.error{border-color:rgba(239,68,68,.5);animation:shake .5s ease}
        .settings-toggle{position:fixed;bottom:24px;left:24px;z-index:40}
        .settings-toggle button{width:44px;height:44px;cursor:pointer;display:flex;align-items:center;justify-content:center;background:rgba(255,255,255,.05);backdrop-filter:blur(12px);border:1px solid rgba(255,255,255,.08);border-radius:50%;color:#71717a;transition:all .3s;font-size:18px}
        .settings-toggle button:hover{color:#fff;background:rgba(255,255,255,.1);border-color:rgba(99,102,241,.3)}
        .tab-btn{transition:all .3s;padding:8px 12px;border-radius:8px;font-size:11px;font-weight:500;color:#71717a;white-space:nowrap}
        .tab-btn.active{background:rgba(99,102,241,.15);color:#818cf8}.tab-btn:hover:not(.active){color:#a1a1aa}
        .tab-content{display:none}.tab-content.active{display:block}
        .editable-text{transition:background .2s}
        .menu-item-edit{display:grid;grid-template-columns:1fr auto;gap:6px;align-items:center;margin-bottom:6px}
        .menu-item-edit input{font-size:11px;padding:6px 10px}
        .menu-item-edit .price-input{max-width:80px;text-align:center;font-family:'JetBrains Mono',monospace}
        .section-label{font-size:10px;font-weight:600;text-transform:uppercase;letter-spacing:.05em;color:#6366f1;margin:16px 0 8px;padding:6px 10px;background:rgba(99,102,241,.06);border-radius:6px;display:flex;align-items:center;gap:6px}
    </style>
</head>
<body class="grain-overlay">

<script>
// ══════════════════════════════════════════════════════════════
// FULL CONFIGURATION — Semua teks, gambar, musik, menu, testimonial
// ══════════════════════════════════════════════════════════════
const DEFAULT_CONFIG = {
    // ── Navigasi ──
    nav_1:"Tentang",nav_2:"Favorit",nav_3:"Menu",nav_4:"Galeri",nav_5:"Kontak",nav_btn:"Pesan",

    // ── Hero ──
    hero_badge:"Buka Setiap Hari 11:00 — 23:30",
    hero_line1:"Welcome to",hero_line2:"3D Cafe",
    hero_subtitle:"Kopi, makanan, dan suasana yang bikin betah. Temukan pengalaman ngopi terbaik di Poris Indah, Tangerang.",
    hero_btn1:"Lihat Menu",hero_btn2:"Lokasi",

    // ── Marquee ──
    marquee_items:[
        "Es Kopi Susu — 23K","Ice Tiramisu Latte — 23K","Pandan Latte — 23K",
        "Rice Bowl — 26K","Spaghetti Carbonara — 29K","Triple Peach Americano — 24K","Mie Goreng 3D — 28K"
    ],

    // ── Stats ──
    stat_1_num:"55+",stat_1_label:"Pilihan Menu",
    stat_2_num:"7K",stat_2_label:"Harga Mulai",
    stat_3_num:"12.5",stat_3_label:"Jam Buka / Hari",
    stat_4_num:"4.8",stat_4_label:"Rating Google",

    // ── About ──
    about_tag:"Tentang Kami",
    about_t1:"Lebih dari Sekedar",about_t2:"Tempat Ngopi",
    about_p1:"3D Cafe hadir di kawasan Poris Indah, Cipondoh sebagai tempat nongkrong yang nyaman dengan konsep modern dan cozy. Kami menyajikan beragam menu kopi, minuman kekinian, hingga makanan berat yang menggugah selera.",
    about_p2:"Dengan harga yang ramah di kantong mulai dari 7 ribuan, 3D Cafe jadi destinasi favorit buat hangout bareng teman, kerja, atau sekedar melepas penat setelah aktivitas.",
    feat_1_t:"55+ Menu",feat_1_d:"Kopi, non-kopi & makanan",
    feat_2_t:"Harga Terjangkau",feat_2_d:"Mulai dari Rp 7.000",
    feat_3_t:"Buka Lama",feat_3_d:"Sampai 23:30 setiap hari",
    feat_4_t:"Free WiFi",feat_4_d:"Cocok buat kerja & nongkrong",
    about_badge_loc:"Poris Indah",about_badge_sub:"Cipondoh, Tangerang",
    about_open:"OPEN NOW",

    // ── Highlights ──
    hl_1_name:"Es Kopi Susu",hl_1_price:"23K",hl_1_desc:"Signature drink andalan 3D Cafe — kopi susu yang creamy dan pas rasa manisnya.",
    hl_2_name:"Ice Tiramisu Latte",hl_2_price:"23K",hl_2_desc:"Perpaduan kopi dan rasa tiramisu yang unik, jadi favorit banyak pelanggan.",
    hl_3_name:"Pandan Latte",hl_3_price:"23K",hl_3_desc:"Latte dengan aroma pandan khas Indonesia, fresh dan aromatic.",
    hl_4_name:"Triple Peach Americano",hl_4_price:"24K",hl_4_desc:"Kopi unik dengan rasa peach fruity yang menyegarkan.",
    hl_5_name:"Rice Bowl",hl_5_price:"26K",hl_5_desc:"Ayam + telur + saus creamy + jamur di atas nasi hangat.",
    hl_6_name:"Spaghetti Carbonara",hl_6_price:"29K",hl_6_desc:"Carbonara creamy dengan bacon yang gurih.",

    // ── Menu Lengkap (JSON) ──
    menu_coffee:[
        {n:"Espresso",p:"10K",d:"Shot kopi murni, bold"},
        {n:"Americano",p:"21K / 22K",d:"Kopi hitam klasik, strong & clean"},
        {n:"Cappuccino",p:"21K / 22K",d:"Espresso + foam creamy"},
        {n:"Cafe Latte",p:"21K / 22K",d:"Smooth & milky"},
        {n:"Flavoured Latte",p:"22K / 23K",d:"Caramel / Hazelnut / Vanilla"},
        {n:"Mocha Latte",p:"22K / 23K",d:"Perpaduan kopi + coklat"},
        {n:"Irish Latte",p:"23K",d:"Latte dengan sentuhan creamy khas"},
        {n:"Triple Peach Americano",p:"24K",d:"Kopi unik rasa peach fruity"}
    ],
    menu_signature:[
        {n:"Es Kopi Susu",p:"23K",d:"Signature andalan",badge:"HIT"},
        {n:"Pandan Latte",p:"23K",d:"Aroma pandan khas Indonesia"},
        {n:"Ice Tiramisu Latte",p:"23K",d:"Rasa tiramisu yang unik"},
        {n:"Butterscotch Caramel",p:"24K",d:"Manis creamy butterscotch"},
        {n:"Yakult Series",p:"23K",d:"Segar probiotik"},
        {n:"Lychee Punch",p:"23K",d:"Segar buah lychee"}
    ],
    menu_tea:[{n:"Lychee Tea",p:"20K"},{n:"Strawberry Tea",p:"20K"},{n:"Lemon Tea",p:"20K"},{n:"Peach Tea",p:"20K"}],
    menu_beverage:[
        {n:"Chocolate",p:"23K"},{n:"Choco Hazelnut",p:"23K"},{n:"Ice Taro Latte",p:"23K"},
        {n:"Matcha Latte",p:"23K"},{n:"Strawberry Mojito",p:"23K"},{n:"Matcha Blend",p:"24K"},
        {n:"Choco Beng Beng Blend",p:"24K"},{n:"Cookies n Cream",p:"24K"},
        {n:"Love Potion",p:"23K"},{n:"Pop Lemonade",p:"23K"},{n:"Mineral Water",p:"7K"}
    ],
    menu_artisan:[{n:"Jasmine Tea",p:"19K"},{n:"Earl Grey Tea",p:"19K"},{n:"Pure Peppermint",p:"19K"},{n:"Chamomile",p:"19K"}],
    menu_snack:[
        {n:"3D Platters",p:"26K",d:"Paket snack komplet"},{n:"French Fries",p:"16K"},{n:"Chicken Skin",p:"19K"},
        {n:"Chicken Pop",p:"21K"},{n:"Roti Lipat",p:"21K"},{n:"Roti Bakar",p:"19K"},
        {n:"Cireng Bumbu Rujak",p:"16K"},{n:"Piscok 3D",p:"18K"},{n:"Singkong Goreng",p:"15K"},{n:"3Donut",p:"18K"}
    ],
    menu_main:[
        {n:"Rice Bowl",p:"26K",d:"Ayam + telur + saus creamy + jamur"},{n:"Spaghetti Aglio Olio",p:"29K"},
        {n:"Spaghetti Bolognese",p:"29K"},{n:"Spaghetti Carbonara",p:"29K"},
        {n:"Mie Goreng 3D",p:"28K"},{n:"Nasi Goreng Spesial",p:"28K"},
        {n:"Bento 3D Roll",p:"25K"},{n:"Kwetiau Goreng Spesial",p:"28K"},
        {n:"Nasi Grill Chicken",p:"30K"},{n:"Kwetiau Kuah",p:"28K"}
    ],
    menu_cat_coffee:"Essential Coffee",menu_cat_signature:"⭐ Signature Drink",
    menu_cat_tea:"🍵 Tea Based",menu_cat_beverage:"🧋 Other Beverage",
    menu_cat_artisan:"🍵 Artisan Tea",menu_cat_snack:"🍟 Snack",menu_cat_main:"🍝 Main Course",
    menu_section_tag:"Menu Lengkap",menu_section_title:"Semua Menu",menu_section_title_sub:"3D Cafe",
    menu_filter_all:"Semua",menu_filter_coffee:"☕ Kopi",menu_filter_sig:"⭐ Signature",
    menu_filter_drink:"🧋 Minuman Lain",menu_filter_food:"🍟 Makanan",
    hl_section_tag:"⭐ Best Sellers",hl_section_title:"Menu Favorit",hl_section_title_sub:"di 3D Cafe",
    hl_section_desc:"Pilihan paling laris dari pelanggan kami — wajib coba!",

    // ── Gallery ──
    gal_tag:"Suasana Kami",gal_title:"Intip",gal_title_sub:"3D Cafe",
    gal_1_txt:"Interior 3D Cafe",gal_1_sub:"Suasana cozy & modern",
    gal_2_txt:"Sudut Nongkrong",gal_3_txt:"Detail Interior",gal_4_txt:"Display Minuman",gal_5_txt:"Menu Makanan",

    // ── Testimonials ──
    test_tag:"Ulasan Tamu",test_title:"Apa Kata",test_title_sub:"Mereka?",
    test_1_name:"Rizky Aditya",test_1_role:"Mahasiswa",test_1_init:"RA",test_1_text:"\"Es Kopi Susu-nya juara banget! Harga 23K tapi rasa sekelas cafe 50K-an. Tempatnya juga cozy, cocok buat kerja atau nongkrong.\"",test_1_stars:5,
    test_2_name:"Sarah Fitri",test_2_role:"Karyawan Swasta",test_2_init:"SF",test_2_text:"\"Ice Tiramisu Latte wajib coba! Unik banget rasanya. Spaghetti Carbonara-nya juga enak, porsinya banyak. Bakal balik lagi.\"",test_2_stars:5,
    test_3_name:"Dimas Wibowo",test_3_role:"Content Creator",test_3_init:"DW",test_3_text:"\"Menu lengkap dari kopi sampai makanan berat, harganya ramah anak muda. WiFi kencang, tempat nyaman.\"",test_3_stars:4,
    test_review_link:"Lihat semua review di Google Maps",

    // ── Contact ──
    contact_tag:"Kunjungi Kami",contact_t1:"Kami Menunggu",contact_t2:"Kedatanganmu",
    contact_desc:"Datang sendiri atau bareng teman — 3D Cafe selalu siap menyambut dengan menu terbaik dan suasana nyaman.",
    contact_loc_label:"Lokasi",contact_loc:"Jl. Poris Indah Blk. E No.860B, RT.002/RW.004, Cipondoh Indah, Kec. Cipondoh, Kota Tangerang, Banten 15148",
    contact_hour_label:"Jam Buka",contact_hour_1:"Setiap hari (Senin — Minggu)",contact_hour_2:"11:00 — 23:30",
    contact_phone_label:"Kontak",contact_phone:"0812-7832-7756 (WhatsApp)",contact_ig:"@3dcafeporis (Instagram)",
    res_title:"Reservasi Meja",res_desc:"Isi formulir untuk reservasi meja di 3D Cafe.",
    res_name:"Nama Lengkap",res_name_ph:"Masukkan namamu",
    res_date:"Tanggal",res_time:"Waktu",res_time_ph:"Pilih waktu",res_people:"Jumlah Orang",res_people_ph:"Pilih",
    res_note:"Catatan (opsional)",res_note_ph:"Permintaan khusus...",res_btn:"Reservasi Sekarang",

    // ── CTA ──
    cta_title:"Yuk ke",cta_title_highlight:"3D Cafe",cta_desc:"Follow Instagram untuk update menu & promo spesial.",
    cta_btn1:"@3dcafeporis",cta_btn2:"Chat WhatsApp",

    // ── Footer ──
    footer_desc:"Kopi, makanan & suasana cozy di Poris Indah, Tangerang. Harga ramah, rasa juara.",
    footer_open:"Buka Sekarang",footer_nav_title:"Navigasi",footer_nav:["Tentang Kami","Menu Favorit","Menu Lengkap","Galeri"],
    footer_hours_title:"Jam Operasional",footer_hours_1:"Senin — Minggu",footer_hours_2:"11:00 — 23:30",
    footer_contact_title:"Kontak",footer_contact:["Jl. Poris Indah Blk. E No.860B","Cipondoh Indah, Tangerang","0812-7832-7756","@3dcafeporis"],
    footer_copy:"© 2025 3D Cafe Poris Indah. All rights reserved.",footer_crafted:"Crafted with ♥ and good coffee",

    // ── Images ──
    about_main:"https://lh3.googleusercontent.com/gps-cs-s/APNQkAFZrxBxYNXw_wWwWidTGbk489nni3TjGVHNfjGhLXFDK6Sdgj1_pmBAb2XdSFjsOgWjEH_AGAdfM4ZgLdiuICDCzbEUVkHFvV4JM69WRzGBGpG02WCfhYrfytDUiKVprUMkXXD0=w800-h1067-n-k-no-nu",
    highlight_1:"https://picsum.photos/seed/es-kopi-susu-3d/600/375.jpg",highlight_2:"https://picsum.photos/seed/ice-tiramisu-latte/600/375.jpg",highlight_3:"https://picsum.photos/seed/pandan-latte-drink/600/375.jpg",
    highlight_4:"https://picsum.photos/seed/triple-peach-americano/600/375.jpg",highlight_5:"https://picsum.photos/seed/rice-bowl-cafe-food/600/375.jpg",highlight_6:"https://picsum.photos/seed/spaghetti-carbonara-plate/600/375.jpg",
    gallery_1:"https://lh3.googleusercontent.com/gps-cs-s/APNQkAFZrxBxYNXw_wWwWidTGbk489nni3TjGVHNfjGhLXFDK6Sdgj1_pmBAb2XdSFjsOgWjEH_AGAdfM4ZgLdiuICDCzbEUVkHFvV4JM69WRzGBGpG02WCfhYrfytDUiKVprUMkXXD0=w800-h1067-n-k-no-nu",
    gallery_2:"https://lh3.googleusercontent.com/gps-cs-s/APNQkAFe-IjRqXL18ORjGOmGaH9XBTr5_2jfCsdiqyiZAMMPcTRkq6bHaGqW5-Eao6zXIDiVspfvDY8A-qRlaAa0vVoApambxpO16mgqnR_KytW7GnKC_aiXuCmf6PaAB3cBjTHLP6py=w800-h1067-n-k-no-nu",
    gallery_3:"https://lh3.googleusercontent.com/gps-cs-s/APNQkAH-iAYnz7NsZqzpo6X-ffxnHoWQZIY_pYGQ95Q2WEHusqE81w4tzqJf1q8wPbqNGoTIWV3jJ9RAVK5zaKBxnzOYL74Y8pjFPyhPnzs4fub77t0Wo9pwGpavEbXYhpMwpF96OopUFvdu9QY=w800-h800-n-k-no-nu",
    gallery_4:"https://picsum.photos/seed/3d-cafe-drinks-display/400/400.jpg",gallery_5:"https://picsum.photos/seed/3d-cafe-food-table/400/400.jpg",

    // ── Music ──
    bgm_url:"https://cdn.pixabay.com/download/audio/2026/05/01/audio_71843cab3e.mp3?filename=u_y433zeithg-late-night-coffee-527611.mp3",
    bgm_volume:"40",
};

const IMAGE_LABELS={about_main:"📸 Foto Utama",highlight_1:"☕ Menu 1",highlight_2:"☕ Menu 2",highlight_3:"☕ Menu 3",highlight_4:"☕ Menu 4",highlight_5:"🍛 Menu 5",highlight_6:"🍝 Menu 6",gallery_1:"🖼️ Galeri 1",gallery_2:"🖼️ Galeri 2",gallery_3:"🖼️ Galeri 3",gallery_4:"🖼️ Galeri 4",gallery_5:"🖼️ Galeri 5"};
const IMAGE_SHAPES={about_main:"tall",gallery_1:"tall",gallery_2:"square",gallery_3:"square",gallery_4:"square",gallery_5:"square"};

let saved={};try{saved=JSON.parse(localStorage.getItem('3dcafe_cfg')||'{}')}catch(e){}
function C(k){
    if(!k)return'';
    let v=saved[k];
    if(v!==undefined)return v;
    v=DEFAULT_CONFIG[k];
    if(v!==undefined)return typeof v==='string'?v:JSON.parse(JSON.stringify(v));
    return'';
}
const ADMIN_PASS="3DxCafe";
let isAdmin=sessionStorage.getItem('3dcafe_auth')==='true';
</script>

<audio id="bgAudio" loop preload="none"><source id="bgmSrc" src="" type="audio/mpeg"></audio>

<!-- Ambient BG -->
<div class="fixed inset-0 pointer-events-none" style="z-index:0"><div class="absolute top-0 left-1/4 w-[800px] h-[500px] rounded-full opacity-[.07]" style="background:radial-gradient(circle,#6366f1,transparent 70%);filter:blur(120px)"></div><div class="absolute bottom-0 right-1/4 w-[600px] h-[600px] rounded-full opacity-[.05]" style="background:radial-gradient(circle,#d946ef,transparent 70%);filter:blur(100px)"></div></div>

<!-- NAV -->
<nav class="fixed top-0 left-0 right-0 z-50 transition-all duration-500" id="navbar">
    <div class="max-w-7xl mx-auto px-6 h-16 flex items-center justify-between">
        <a href="#" class="flex items-center gap-2.5"><div class="w-8 h-8 rounded-lg flex items-center justify-center" style="background:linear-gradient(to top right,#6366f1,#d946ef)"><span class="text-white text-[11px] font-bold">3D</span></div><span class="logo-3d" id="t-logo"></span></a>
        <div class="hidden md:flex items-center gap-8" id="navLinks"></div>
        <div class="hidden md:flex items-center gap-3"><a href="https://wa.me/6281278327756" target="_blank" class="btn-primary px-5 py-2 rounded-full text-xs font-medium inline-flex items-center gap-1.5"><span class="iconify text-sm" data-icon="mdi:whatsapp"></span> <span id="t-nav-btn"></span></a></div>
        <button class="md:hidden w-10 h-10 flex items-center justify-center rounded-lg glass" onclick="toggleMobile()"><span class="iconify text-xl" data-icon="ph:list-bold"></span></button>
    </div>
</nav>

<!-- Mobile Menu -->
<div class="mobile-menu fixed inset-0 z-50 bg-[#09090b]/95 backdrop-blur-xl flex flex-col" id="mobileMenu">
    <div class="px-6 h-16 flex items-center justify-between"><div class="flex items-center gap-2.5"><div class="w-8 h-8 rounded-lg flex items-center justify-center" style="background:linear-gradient(to top right,#6366f1,#d946ef)"><span class="text-white text-[11px] font-bold">3D</span></div><span class="logo-3d" id="t-logo-m"></span></div><button class="w-10 h-10 flex items-center justify-center rounded-lg glass" onclick="toggleMobile()"><span class="iconify text-xl" data-icon="ph:x-bold"></span></button></div>
    <div class="flex-1 flex flex-col items-center justify-center gap-8" id="mobileNavLinks"></div>
</div>

<!-- HERO -->
<section class="relative min-h-screen flex items-center justify-center px-6" style="padding-top:64px" id="heroSection"></section>

<!-- MARQUEE -->
<div class="relative overflow-hidden py-5 border-y border-white/[.04]" style="z-index:1" id="marqueeSection"></div>

<!-- STATS -->
<section class="py-16 px-6 relative" style="z-index:1" id="statsSection"></section>
<div class="divider max-w-4xl mx-auto"></div>

<!-- ABOUT -->
<section id="about" class="py-24 sm:py-32 px-6 relative" style="z-index:1"></section>
<div class="divider max-w-4xl mx-auto"></div>

<!-- HIGHLIGHTS -->
<section id="highlights" class="py-24 sm:py-32 px-6 relative" style="z-index:1"></section>
<div class="divider max-w-4xl mx-auto"></div>

<!-- FULL MENU -->
<section id="menu" class="py-24 sm:py-32 px-6 relative" style="z-index:1"></section>
<div class="divider max-w-4xl mx-auto"></div>

<!-- GALLERY -->
<section id="gallery" class="py-24 sm:py-32 px-6 relative" style="z-index:1"></section>
<div class="divider max-w-4xl mx-auto"></div>

<!-- TESTIMONIALS -->
<section id="testimonials" class="py-24 sm:py-32 px-6 relative" style="z-index:1"></section>
<div class="divider max-w-4xl mx-auto"></div>

<!-- CONTACT -->
<section id="contact" class="py-24 sm:py-32 px-6 relative" style="z-index:1"></section>
<div class="divider max-w-4xl mx-auto"></div>

<!-- CTA -->
<section class="py-24 px-6 relative" style="z-index:1" id="ctaSection"></section>

<!-- FOOTER -->
<footer class="border-t border-white/[.05] py-12 px-6" style="z-index:1" id="footerSection"></footer>

<!-- Toast -->
<div class="toast" id="toast"><div class="glass-strong rounded-xl px-6 py-4 flex items-center gap-3"><div class="w-8 h-8 rounded-lg flex items-center justify-center flex-shrink-0" style="background:rgba(16,185,129,.15)"><span class="iconify text-emerald-400" data-icon="ph:check-bold"></span></div><div><p class="text-sm font-medium" id="toastTitle"></p><p class="text-xs text-zinc-400 font-light" id="toastMsg"></p></div></div></div>

<!-- WhatsApp Float -->
<a href="https://wa.me/6281278327756" target="_blank" class="fixed bottom-6 right-6 z-40 w-14 h-14 rounded-full flex items-center justify-center transition-all duration-300 hover:scale-110" style="background:#25d366;box-shadow:0 4px 20px rgba(37,211,102,.4)"><span class="iconify text-white text-2xl" data-icon="mdi:whatsapp"></span></a>

<!-- Music Player -->
<div class="fixed bottom-6 left-24 z-40 flex items-end gap-3" id="musicArea">
    <div class="music-panel glass-strong rounded-2xl p-5 w-[220px]" id="musicPanel">
        <div class="flex items-center justify-between mb-4"><div class="flex items-center gap-2"><div class="w-8 h-8 rounded-lg flex items-center justify-center" style="background:linear-gradient(135deg,rgba(99,102,241,.15),rgba(217,70,239,.15))"><span class="iconify text-sm text-indigo-400" data-icon="ph:music-notes-bold"></span></div><div><p class="text-xs font-medium">Backsound</p><p class="text-[10px] text-zinc-500" id="musicStatus">Paused</p></div></div><div class="flex items-end gap-[3px] h-5 eq-paused" id="eqBars"><div class="eq-bar" style="height:3px"></div><div class="eq-bar" style="height:3px"></div><div class="eq-bar" style="height:3px"></div><div class="eq-bar" style="height:3px"></div></div></div>
        <div class="flex items-center gap-3 mb-3"><span class="iconify text-xs text-zinc-500" id="volIcon" data-icon="ph:speaker-none-bold"></span><input type="range" min="0" max="100" value="40" class="vol-slider flex-1" id="volSlider" oninput="changeVol(this.value)"><span class="text-[10px] text-zinc-500 font-mono w-7 text-right" id="volVal">40%</span></div>
        <div class="flex items-center gap-2"><button onclick="toggleMute()" class="flex-1 py-2 rounded-lg text-xs font-medium glass text-zinc-400 hover:text-white transition-all flex items-center justify-center gap-1.5" id="muteBtn"><span class="iconify text-sm" data-icon="ph:speaker-high-bold"></span> Unmute</button><button onclick="stopMusic()" class="py-2 px-3 rounded-lg text-xs glass text-zinc-500 hover:text-red-400 transition-all" title="Stop"><span class="iconify text-sm" data-icon="ph:stop-bold"></span></button></div>
    </div>
    <button onclick="toggleMusic()" class="w-14 h-14 rounded-full flex items-center justify-center transition-all duration-300 hover:scale-110" id="musicBtn" style="background:rgba(255,255,255,.05);backdrop-filter:blur(12px);border:1px solid rgba(255,255,255,.08);box-shadow:0 4px 20px rgba(0,0,0,.3)"><span class="iconify text-xl text-zinc-500" data-icon="ph:music-notes-simple-bold" id="musicBtnIcon"></span></button>
</div>

<!-- Settings Toggle -->
<div class="settings-toggle"><button onclick="tryOpen()" title="Admin Panel"><span class="iconify" data-icon="ph:gear-six-bold"></span></button></div>

<!-- PW Modal -->
<div class="pw-modal" id="pwModal"><div class="modal-box glass-strong rounded-3xl p-8 w-[90vw] max-w-sm text-center"><div class="w-16 h-16 rounded-2xl mx-auto mb-6 flex items-center justify-center" style="background:linear-gradient(135deg,rgba(99,102,241,.15),rgba(217,70,239,.15))"><span class="iconify text-3xl text-indigo-400" data-icon="ph:lock-key-bold"></span></div><h3 class="text-lg font-semibold mb-2">Admin Access</h3><p class="text-xs text-zinc-500 font-light mb-6">Masukkan password untuk mengakses panel.</p><form onsubmit="submitPw(event)"><input type="password" id="pwInput" class="pw-input mb-4" placeholder="••••••••" required autocomplete="off"><p id="pwErr" class="text-xs text-red-400 font-light mb-4 h-4"></p><div class="flex gap-3"><button type="button" onclick="closePw()" class="flex-1 py-3 rounded-xl text-sm font-medium border border-white/[.08] text-zinc-400 hover:text-white transition-all">Batal</button><button type="submit" class="btn-primary flex-1 py-3 rounded-xl text-sm font-medium">Masuk</button></div></form></div></div>

<!-- Settings Overlay -->
<div class="settings-overlay" id="settingsOverlay" onclick="closeSettings()"></div>

<!-- Settings Panel -->
<div class="settings-panel" id="settingsPanel">
    <div class="p-6">
        <div class="flex items-center justify-between mb-6"><div><h3 class="text-lg font-semibold flex items-center gap-2"><span class="iconify text-indigo-400" data-icon="ph:sliders-bold"></span> Admin Panel</h3><p class="text-xs text-zinc-500 font-light mt-1">Edit semua teks, gambar & musik</p></div><div class="flex items-center gap-2"><button onclick="logout()" class="w-9 h-9 rounded-lg glass flex items-center justify-center text-zinc-500 hover:text-red-400 transition-colors" title="Logout"><span class="iconify text-lg" data-icon="ph:sign-out-bold"></span></button><button onclick="closeSettings()" class="w-9 h-9 rounded-lg glass flex items-center justify-center text-zinc-400 hover:text-white transition-colors"><span class="iconify text-lg" data-icon="ph:x-bold"></span></button></div></div>
        <div class="flex gap-1 mb-6 p-1 glass rounded-xl overflow-x-auto">
            <button class="tab-btn active" onclick="switchTab('text',this)">📝 Teks</button>
            <button class="tab-btn" onclick="switchTab('menu',this)">🍽️ Menu</button>
            <button class="tab-btn" onclick="switchTab('images',this)">🖼️ Gambar</button>
            <button class="tab-btn" onclick="switchTab('music',this)">🎵 Musik</button>
        </div>
        <div id="tab-text" class="tab-content active"><div id="textSlots"></div></div>
        <div id="tab-menu" class="tab-content"><div id="menuSlots"></div></div>
        <div id="tab-images" class="tab-content"><div class="glass rounded-xl p-4 mb-4"><p class="text-xs text-zinc-400 font-light">💡 Upload ke <a href="https://imgbb.com" target="_blank" class="text-indigo-400 underline">imgbb.com</a>, copy "Direct link".</p></div><div id="imageSlots"></div></div>
        <div id="tab-music" class="tab-content">
            <div class="glass rounded-xl p-5 mb-4"><h4 class="text-sm font-medium mb-1">🎵 URL Backsound</h4><p class="text-xs text-zinc-500 font-light mb-3">Direct link .mp3 dari <a href="https://pixabay.com/music/" target="_blank" class="text-indigo-400 underline">Pixabay Music</a></p><input class="text-edit-input" id="bgmUrlIn" placeholder="https://...mp3" onfocus="this.select()"></div>
            <div class="glass rounded-xl p-5"><h4 class="text-sm font-medium mb-1">🔊 Volume Default</h4><p class="text-xs text-zinc-500 font-light mb-3">Volume saat halaman dimuat (0-100)</p><div class="flex items-center gap-3"><input type="range" min="0" max="100" value="40" class="vol-slider flex-1" id="bgmVolIn"><span class="text-xs text-zinc-400 font-mono w-8 text-right" id="bgmVolLbl">40%</span></div></div>
        </div>
        <div class="flex items-center gap-3 mt-8 pt-6 border-t border-white/[.06]">
            <button onclick="saveAll()" class="btn-primary flex-1 py-3 rounded-xl text-sm font-medium flex items-center justify-center gap-2"><span class="iconify" data-icon="ph:check-bold"></span> Simpan Semua</button>
            <button onclick="resetAll()" class="reset-btn flex-1 py-3 rounded-xl text-sm font-medium flex items-center justify-center gap-2 border border-white/[.08] text-zinc-400"><span class="iconify" data-icon="ph:arrow-counter-clockwise-bold"></span> Reset</button>
        </div>
        <div class="mt-4 flex gap-3"><button onclick="exportCfg()" class="flex-1 py-2.5 rounded-xl text-xs font-medium flex items-center justify-center gap-2 border border-white/[.06] text-zinc-500 hover:text-zinc-300 transition-all"><span class="iconify" data-icon="ph:download-simple-bold"></span> Export</button><button onclick="document.getElementById('impF').click()" class="flex-1 py-2.5 rounded-xl text-xs font-medium flex items-center justify-center gap-2 border border-white/[.06] text-zinc-500 hover:text-zinc-300 transition-all"><span class="iconify" data-icon="ph:upload-simple-bold"></span> Import</button><input type="file" id="impF" accept=".json" style="display:none" onchange="importCfg(event)"></div>
    </div>
</div>

<script>
// ═══════════════════════════════════════════════════
// DYNAMIC CONTENT RENDERING
// ═══════════════════════════════════════════════════

function renderAll(){
    renderNav();renderHero();renderMarquee();renderStats();renderAbout();
    renderHighlights();renderFullMenu();renderGallery();renderTestimonials();
    renderContact();renderCTA();renderFooter();applyAudio();
    setTimeout(()=>document.querySelectorAll('.animate-on-scroll').forEach(el=>obs.observe(el)),100);
}

function T(k){return C(k)}
function starsHtml(n){let s='';for(let i=0;i<5;i++)s+=`<span class="iconify text-sm ${i<n?'text-amber-400':'text-zinc-600'}" data-icon="ph:star-fill"></span>`;return s}

// NAV
function renderNav(){
    const links=[['#about','nav_1'],['#highlights','nav_2'],['#menu','nav_3'],['#gallery','nav_4'],['#contact','nav_5']];
    document.getElementById('navLinks').innerHTML=links.map(l=>`<a href="${l[0]}" class="nav-link text-sm font-light text-zinc-400">${T(l[1])}</a>`).join('');
    document.getElementById('mobileNavLinks').innerHTML=links.map(l=>`<a href="${l[0]}" onclick="toggleMobile()" class="text-2xl font-light text-zinc-300 hover:text-white transition-colors">${T(l[1])}</a>`).join('')+`<a href="https://wa.me/6281278327756" target="_blank" onclick="toggleMobile()" class="btn-primary px-8 py-3 rounded-full text-sm font-medium mt-4 inline-flex items-center gap-2"><span class="iconify" data-icon="mdi:whatsapp"></span> Pesan</a>`;
    document.getElementById('t-nav-btn').textContent=T('nav_btn');
    document.getElementById('t-logo').textContent=T('hero_line2');
    document.getElementById('t-logo-m').textContent=T('hero_line2');
}

// HERO
function renderHero(){
    document.getElementById('heroSection').innerHTML=`
        <div class="absolute top-20 right-[10%] w-[300px] h-[300px] deco-blob pointer-events-none" style="background:linear-gradient(135deg,#6366f1,#d946ef)"></div>
        <div class="absolute bottom-32 left-[5%] w-[200px] h-[200px] deco-blob pointer-events-none" style="background:linear-gradient(135deg,#f59e0b,#ef4444);animation-delay:4s"></div>
        <div class="absolute top-1/4 left-[8%] deco-ring pointer-events-none opacity-[.03]"><svg width="120" height="120"><circle cx="60" cy="60" r="55" fill="none" stroke="url(#g1)" stroke-width=".5" stroke-dasharray="4 4"/><defs><linearGradient id="g1"><stop offset="0%" stop-color="#6366f1"/><stop offset="100%" stop-color="#d946ef"/></linearGradient></defs></svg></div>
        <div class="max-w-5xl mx-auto text-center relative z-10">
            <div class="hero-badge inline-flex items-center gap-2 px-4 py-1.5 rounded-full glass mb-8"><span class="w-1.5 h-1.5 rounded-full bg-emerald-500" style="box-shadow:0 0 8px rgba(16,185,129,.6)"></span><span class="text-[10px] font-medium uppercase tracking-wider text-zinc-400">${T('hero_badge')}</span></div>
            <h1 class="hero-title text-5xl sm:text-6xl lg:text-8xl font-bold tracking-tight leading-[1.05] mb-6"><span class="block">${T('hero_line1')}</span><span class="block" style="background:linear-gradient(135deg,#a5b4fc,#fff 30%,#c084fc 60%,#f0abfc);-webkit-background-clip:text;-webkit-text-fill-color:transparent;animation:shimmer 4s linear infinite;background-size:200% auto">${T('hero_line2')}</span></h1>
            <p class="hero-sub text-base sm:text-lg font-light text-zinc-400 max-w-xl mx-auto mb-10 leading-relaxed">${T('hero_subtitle')}</p>
            <div class="hero-cta flex flex-col sm:flex-row items-center justify-center gap-4">
                <a href="#menu" class="btn-primary px-8 py-3.5 rounded-full text-sm font-medium inline-flex items-center gap-2">${T('hero_btn1')} <span class="iconify text-base" data-icon="ph:arrow-down-bold"></span></a>
                <a href="https://maps.google.com/?q=3D+Cafe+Poris+Indah" target="_blank" class="btn-outline px-8 py-3.5 rounded-full text-sm font-medium inline-flex items-center gap-2"><span class="iconify" data-icon="ph:map-pin-bold"></span> ${T('hero_btn2')}</a>
            </div>
            <div class="absolute -left-10 top-1/3 hidden lg:block float-1 opacity-[.12]"><span class="iconify text-7xl text-indigo-400" data-icon="ph:coffee-bold"></span></div>
            <div class="absolute -right-5 top-1/4 hidden lg:block float-2 opacity-[.08]"><span class="iconify text-6xl text-fuchsia-400" data-icon="ph:cube-bold"></span></div>
            <div class="absolute right-16 bottom-1/4 hidden lg:block float-3 opacity-[.08]"><span class="iconify text-5xl text-amber-400" data-icon="ph:fork-knife-bold"></span></div>
        </div>
        <div class="absolute bottom-10 left-1/2 -translate-x-1/2 flex flex-col items-center gap-2 opacity-40"><span class="text-[10px] uppercase tracking-widest text-zinc-500">Scroll</span><div class="w-5 h-8 rounded-full border border-zinc-600 flex items-start justify-center p-1.5"><div class="w-1 h-2 bg-zinc-400 rounded-full" style="animation:fadeInUp 1.5s ease-in-out infinite"></div></div></div>`;
}

// MARQUEE
function renderMarquee(){
    const items=C('marquee_items');if(!Array.isArray(items))return;
    const spans=items.map(i=>`<span class="flex items-center gap-2"><span class="iconify text-indigo-500/40" data-icon="ph:coffee-bold"></span> ${i}</span><span class="text-zinc-800">✦</span>`).join('');
    document.getElementById('marqueeSection').innerHTML=`<div class="marquee-track"><span class="flex items-center gap-8 px-4 text-xs font-light text-zinc-600 whitespace-nowrap">${spans}</span><span class="flex items-center gap-8 px-4 text-xs font-light text-zinc-600 whitespace-nowrap">${spans}</span></div>`;
}

// STATS
function renderStats(){
    const stats=[['stat_1_num','stat_1_label'],['stat_2_num','stat_2_label'],['stat_3_num','stat_3_label'],['stat_4_num','stat_4_label']];
    const colors=[['#a5b4fc','#818cf8'],['#c084fc','#d946ef'],['#34d399','#10b981'],['#fbbf24','#f59e0b']];
    document.getElementById('statsSection').innerHTML=`<div class="max-w-5xl mx-auto"><div class="grid grid-cols-2 lg:grid-cols-4 gap-4">${stats.map((s,i)=>`<div class="animate-on-scroll d${i} glass rounded-2xl p-6 text-center relative overflow-hidden group"><div class="absolute inset-0 deco-dots opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div><div class="relative z-10"><p class="text-3xl sm:text-4xl font-bold stat-number" style="background:linear-gradient(135deg,${colors[i][0]},${colors[i][1]});-webkit-background-clip:text;-webkit-text-fill-color:transparent">${T(s[0])}</p><p class="text-xs text-zinc-500 font-light mt-2 ${i===3?'flex items-center justify-center gap-1':''}">${i===3?'<span class="iconify text-amber-400" data-icon="ph:star-fill"></span>':''}${T(s[1])}</p></div></div>`).join('')}</div></div>`;
}

// ABOUT
function renderAbout(){
    const featIcons=['ph:coffee-bold','ph:wallet-bold','ph:clock-bold','ph:wi-fi-high-bold'];
    const featColors=['text-indigo-400','text-fuchsia-400','text-emerald-400','text-amber-400'];
    document.getElementById('about').innerHTML=`
        <div class="absolute top-0 right-0 w-[300px] h-[300px] deco-blob pointer-events-none" style="background:linear-gradient(135deg,#6366f1,transparent);opacity:.02"></div>
        <div class="corner-accent corner-tl" style="top:40px;left:40px"></div><div class="corner-accent corner-br" style="bottom:40px;right:40px"></div>
        <div class="max-w-7xl mx-auto">
            <div class="section-deco animate-on-scroll"><div class="line"></div><div class="diamond"></div><div class="line"></div></div>
            <div class="grid lg:grid-cols-2 gap-16 items-center">
                <div class="animate-on-scroll relative">
                    <div class="relative rounded-2xl overflow-hidden aspect-[3/4]" style="animation:pulse-glow 4s ease-in-out infinite"><img id="img-about_main" src="${C('about_main')}" alt="" class="w-full h-full object-cover"><div class="absolute inset-0" style="background:linear-gradient(to top,#09090b 0%,transparent 50%)"></div></div>
                    <div class="absolute -bottom-6 -right-6 sm:right-auto sm:-left-6 glass-strong rounded-2xl p-5 float-2"><div class="flex items-center gap-3"><div class="w-12 h-12 rounded-xl flex items-center justify-center" style="background:linear-gradient(135deg,rgba(99,102,241,.2),rgba(217,70,239,.2))"><span class="iconify text-2xl text-indigo-400" data-icon="ph:map-pin-bold"></span></div><div><p class="text-lg font-semibold">${T('about_badge_loc')}</p><p class="text-xs text-zinc-400 font-light">${T('about_badge_sub')}</p></div></div></div>
                    <div class="absolute top-6 right-6 glass rounded-xl px-3 py-2 float-3 flex items-center gap-2"><span class="w-2 h-2 rounded-full bg-emerald-500" style="box-shadow:0 0 8px rgba(16,185,129,.5)"></span><span class="text-[10px] text-zinc-400 font-medium">${T('about_open')}</span></div>
                </div>
                <div>
                    <div class="animate-on-scroll"><span class="text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">${T('about_tag')}</span><h2 class="text-3xl sm:text-4xl font-semibold tracking-tight mb-6">${T('about_t1')}<br><span class="text-zinc-400">${T('about_t2')}</span></h2></div>
                    <div class="animate-on-scroll d1"><p class="text-sm font-light text-zinc-400 leading-relaxed mb-6">${T('about_p1')}</p><p class="text-sm font-light text-zinc-400 leading-relaxed mb-10">${T('about_p2')}</p></div>
                    <div class="grid grid-cols-2 gap-4">${[1,2,3,4].map(i=>`<div class="animate-on-scroll d${i+1} glass rounded-xl p-4 group"><span class="iconify text-xl ${featColors[i-1]} mb-3 block group-hover:scale-110 transition-transform" data-icon="${featIcons[i-1]}"></span><p class="text-sm font-medium mb-1">${T('feat_'+i+'_t')}</p><p class="text-xs text-zinc-500 font-light">${T('feat_'+i+'_d')}</p></div>`).join('')}</div>
                </div>
            </div>
        </div>`;
}

// HIGHLIGHTS
function renderHighlights(){
    let cards='';for(let i=1;i<=6;i++){
        const sig=i<=3;cards+=`<div class="animate-on-scroll d${Math.min(i,4)} menu-card glass rounded-2xl overflow-hidden"><div class="aspect-[16/10] overflow-hidden relative"><img src="${C('highlight_'+i)}" alt="" class="menu-img w-full h-full object-cover">${sig?'<div class="absolute top-3 left-3 star-badge rounded-full px-2.5 py-1 flex items-center gap-1"><span class="iconify text-amber-400 text-xs" data-icon="ph:star-fill"></span><span class="text-[10px] font-medium text-amber-300">Signature</span></div>':''}</div><div class="p-6"><div class="flex items-start justify-between mb-2"><h3 class="text-base font-medium">${T('hl_'+i+'_name')}</h3><span class="price-tag">${T('hl_'+i+'_price')}</span></div><p class="text-xs text-zinc-500 font-light leading-relaxed">${T('hl_'+i+'_desc')}</p></div></div>`;
    }
    document.getElementById('highlights').innerHTML=`<div class="absolute bottom-0 left-0 w-[250px] h-[250px] deco-blob pointer-events-none" style="background:linear-gradient(135deg,#d946ef,transparent);opacity:.02;animation-delay:3s"></div><div class="max-w-7xl mx-auto"><div class="section-deco animate-on-scroll"><div class="line"></div><div class="diamond"></div><div class="line"></div></div><div class="text-center mb-16"><span class="animate-on-scroll text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">${T('hl_section_tag')}</span><h2 class="animate-on-scroll d1 text-3xl sm:text-4xl font-semibold tracking-tight mb-4">${T('hl_section_title')} <span class="text-zinc-400">${T('hl_section_title_sub')}</span></h2><p class="animate-on-scroll d2 text-sm font-light text-zinc-400 max-w-md mx-auto">${T('hl_section_desc')}</p></div><div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">${cards}</div></div>`;
}

// FULL MENU
function renderFullMenu(){
    const cats=[
        {key:'coffee',label:'menu_cat_coffee',items:'menu_coffee'},
        {key:'signature',label:'menu_cat_signature',items:'menu_signature'},
        {key:'tea',label:'menu_cat_tea',items:'menu_tea'},
        {key:'other-drink',label:'menu_cat_beverage',items:'menu_beverage'},
        {key:'other-drink',label:'menu_cat_artisan',items:'menu_artisan'},
        {key:'food',label:'menu_cat_snack',items:'menu_snack'},
        {key:'food',label:'menu_cat_main',items:'menu_main'}
    ];
    const filters=[['all','menu_filter_all'],['coffee','menu_filter_coffee'],['signature','menu_filter_sig'],['other-drink','menu_filter_drink'],['food','menu_filter_food']];
    let menuHtml='';
    cats.forEach((cat,i)=>{
        const items=C(cat.items);if(!Array.isArray(items))return;
        menuHtml+=`<div class="menu-category animate-on-scroll d${Math.min(i,4)}" data-cat="${cat.key}"><h3 class="category-header text-lg font-medium mb-4">${T(cat.label)}</h3><div class="glass rounded-2xl overflow-hidden mb-8">${items.map(it=>`<div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div>${it.badge?`<div class="flex items-center gap-2"><p class="text-sm font-medium">${it.n}</p><span class="text-[9px] px-1.5 py-0.5 rounded bg-amber-500/10 text-amber-400 font-medium">${it.badge}</span></div>`:`<p class="text-sm font-medium">${it.n}</p>`}${it.d?`<p class="text-xs text-zinc-500 font-light">${it.d}</p>`:''}</div><span class="price-tag">${it.p}</span></div>`).join('')}</div></div>`;
    });
    document.getElementById('menu').innerHTML=`<div class="max-w-5xl mx-auto"><div class="section-deco animate-on-scroll"><div class="line"></div><div class="diamond"></div><div class="line"></div></div><div class="text-center mb-12"><span class="animate-on-scroll text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">${T('menu_section_tag')}</span><h2 class="animate-on-scroll d1 text-3xl sm:text-4xl font-semibold tracking-tight mb-4">${T('menu_section_title')} <span class="text-zinc-400">${T('menu_section_title_sub')}</span></h2></div><div class="animate-on-scroll d2 flex flex-wrap justify-center gap-3 mb-12">${filters.map(f=>`<button class="cat-btn ${f[0]==='all'?'active':''} px-5 py-2 rounded-full text-xs font-medium border border-transparent ${f[0]!=='all'?'text-zinc-400':''}" onclick="filterMenu('${f[0]}',this)">${T(f[1])}</button>`).join('')}</div><div id="menuContainer">${menuHtml}</div></div>`;
}

// GALLERY
function renderGallery(){
    document.getElementById('gallery').innerHTML=`<div class="max-w-7xl mx-auto"><div class="section-deco animate-on-scroll"><div class="line"></div><div class="diamond"></div><div class="line"></div></div><div class="text-center mb-16"><span class="animate-on-scroll text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">${T('gal_tag')}</span><h2 class="animate-on-scroll d1 text-3xl sm:text-4xl font-semibold tracking-tight mb-4">${T('gal_title')} <span class="text-zinc-400">${T('gal_title_sub')}</span></h2></div><div class="grid grid-cols-2 lg:grid-cols-4 gap-4"><div class="animate-on-scroll col-span-2 row-span-2 gallery-item relative rounded-2xl overflow-hidden cursor-pointer" style="min-height:400px"><img src="${C('gallery_1')}" alt="" class="w-full h-full object-cover absolute inset-0"><div class="gallery-overlay absolute inset-0 bg-black/50 flex items-end p-6 opacity-0"><div><p class="text-sm font-medium">${T('gal_1_txt')}</p><p class="text-xs text-zinc-400 font-light">${T('gal_1_sub')}</p></div></div></div>${[2,3,4,5].map(i=>`<div class="animate-on-scroll d${i-1} gallery-item relative rounded-2xl overflow-hidden aspect-square cursor-pointer"><img src="${C('gallery_'+i)}" alt="" class="w-full h-full object-cover absolute inset-0"><div class="gallery-overlay absolute inset-0 bg-black/50 flex items-end p-4 opacity-0"><p class="text-xs font-medium">${T('gal_'+i+'_txt')}</p></div></div>`).join('')}</div></div></div>`;
}

// TESTIMONIALS
function renderTestimonials(){
    const grads=['linear-gradient(135deg,#6366f1,#d946ef)','linear-gradient(135deg,#10b981,#06b6d4)','linear-gradient(135deg,#f59e0b,#ef4444)'];
    document.getElementById('testimonials').innerHTML=`<div class="max-w-5xl mx-auto"><div class="section-deco animate-on-scroll"><div class="line"></div><div class="diamond"></div><div class="line"></div></div><div class="text-center mb-16"><span class="animate-on-scroll text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">${T('test_tag')}</span><h2 class="animate-on-scroll d1 text-3xl sm:text-4xl font-semibold tracking-tight mb-4">${T('test_title')} <span class="text-zinc-400">${T('test_title_sub')}</span></h2></div><div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">${[1,2,3].map((n,i)=>`<div class="animate-on-scroll d${i} testimonial-card glass rounded-2xl p-6"><div class="flex gap-1 mb-4">${starsHtml(C('test_'+n+'_stars'))}</div><p class="text-sm font-light text-zinc-300 leading-relaxed mb-6">${T('test_'+n+'_text')}</p><div class="flex items-center gap-3"><div class="w-9 h-9 rounded-full flex items-center justify-center text-xs font-medium" style="background:${grads[i-1]}">${T('test_'+n+'_init')}</div><div><p class="text-sm font-medium">${T('test_'+n+'_name')}</p><p class="text-xs text-zinc-500 font-light">${T('test_'+n+'_role')}</p></div></div></div>`).join('')}</div><div class="animate-on-scroll d3 mt-8 text-center"><a href="https://maps.google.com/?q=3D+Cafe+Poris+Indah" target="_blank" class="inline-flex items-center gap-2 glass rounded-full px-5 py-2.5 hover:bg-white/[.05] transition-all duration-300"><span class="iconify text-lg text-amber-400" data-icon="ph:star-fill"></span><span class="text-sm font-medium">${T('test_review_link')}</span><span class="iconify text-sm text-zinc-400" data-icon="ph:arrow-up-right-bold"></span></a></div></div></div>`;
}

// CONTACT
function renderContact(){
    document.getElementById('contact').innerHTML=`<div class="corner-accent corner-tl" style="top:80px;left:40px"></div><div class="max-w-7xl mx-auto"><div class="section-deco animate-on-scroll"><div class="line"></div><div class="diamond"></div><div class="line"></div></div><div class="grid lg:grid-cols-2 gap-16"><div><span class="animate-on-scroll text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">${T('contact_tag')}</span><h2 class="animate-on-scroll d1 text-3xl sm:text-4xl font-semibold tracking-tight mb-6">${T('contact_t1')}<br><span class="text-zinc-400">${T('contact_t2')}</span></h2><p class="animate-on-scroll d2 text-sm font-light text-zinc-400 leading-relaxed mb-10">${T('contact_desc')}</p><div class="space-y-4"><div class="animate-on-scroll d2 glass rounded-xl p-5 flex items-start gap-4"><div class="w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0" style="background:rgba(99,102,241,.1)"><span class="iconify text-lg text-indigo-400" data-icon="ph:map-pin-bold"></span></div><div><p class="text-sm font-medium mb-1">${T('contact_loc_label')}</p><p class="text-xs text-zinc-400 font-light">${T('contact_loc')}</p></div></div><div class="animate-on-scroll d3 glass rounded-xl p-5 flex items-start gap-4"><div class="w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0" style="background:rgba(217,70,239,.1)"><span class="iconify text-lg text-fuchsia-400" data-icon="ph:clock-bold"></span></div><div><p class="text-sm font-medium mb-1">${T('contact_hour_label')}</p><p class="text-xs text-zinc-400 font-light">${T('contact_hour_1')}</p><p class="text-xs text-zinc-400 font-light">${T('contact_hour_2')}</p></div></div><div class="animate-on-scroll d4 glass rounded-xl p-5 flex items-start gap-4"><div class="w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0" style="background:rgba(16,185,129,.1)"><span class="iconify text-lg text-emerald-400" data-icon="ph:phone-bold"></span></div><div><p class="text-sm font-medium mb-1">${T('contact_phone_label')}</p><p class="text-xs text-zinc-400 font-light">${T('contact_phone')}</p><p class="text-xs text-zinc-400 font-light">${T('contact_ig')}</p></div></div></div><div class="animate-on-scroll d5 flex items-center gap-3 mt-8"><a href="https://instagram.com/3dcafeporis" target="_blank" class="w-10 h-10 rounded-lg glass flex items-center justify-center text-zinc-400 hover:text-white transition-all"><span class="iconify text-lg" data-icon="mdi:instagram"></span></a><a href="https://wa.me/6281278327756" target="_blank" class="w-10 h-10 rounded-lg glass flex items-center justify-center text-zinc-400 hover:text-white transition-all"><span class="iconify text-lg" data-icon="mdi:whatsapp"></span></a><a href="https://maps.google.com/?q=3D+Cafe+Poris+Indah" target="_blank" class="w-10 h-10 rounded-lg glass flex items-center justify-center text-zinc-400 hover:text-white transition-all"><span class="iconify text-lg" data-icon="ph:google-logo-bold"></span></a></div><div class="animate-on-scroll d5 mt-8 rounded-2xl overflow-hidden aspect-[16/9] glass"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3966.2!2d106.63!3d-6.17!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2s3D+Cafe+Poris+Indah!5e0!3m2!1sid!2sid!4v1" width="100%" height="100%" style="border:0;filter:invert(.9) hue-rotate(180deg) brightness(.8) contrast(1.2)" allowfullscreen loading="lazy"></iframe></div></div><div class="animate-on-scroll d2"><div class="glass-strong rounded-2xl p-8"><h3 class="text-lg font-medium mb-1">${T('res_title')}</h3><p class="text-xs text-zinc-500 font-light mb-8">${T('res_desc')}</p><form onsubmit="handleRes(event)" class="space-y-5"><div><label class="text-xs text-zinc-400 font-medium mb-2 block">${T('res_name')}</label><input type="text" required placeholder="${T('res_name_ph')}" class="w-full bg-white/[.03] border border-white/[.08] rounded-xl px-4 py-3 text-sm font-light text-white placeholder:text-zinc-600 focus:outline-none focus:border-indigo-500/50"></div><div class="grid grid-cols-2 gap-4"><div><label class="text-xs text-zinc-400 font-medium mb-2 block">${T('res_date')}</label><input type="date" required class="w-full bg-white/[.03] border border-white/[.08] rounded-xl px-4 py-3 text-sm font-light text-white focus:outline-none focus:border-indigo-500/50" style="color-scheme:dark"></div><div><label class="text-xs text-zinc-400 font-medium mb-2 block">${T('res_time')}</label><select required class="w-full bg-white/[.03] border border-white/[.08] rounded-xl px-4 py-3 text-sm font-light text-white focus:outline-none focus:border-indigo-500/50" style="color-scheme:dark"><option value="" class="bg-zinc-900">${T('res_time_ph')}</option><option value="11:00" class="bg-zinc-900">11:00</option><option value="13:00" class="bg-zinc-900">13:00</option><option value="15:00" class="bg-zinc-900">15:00</option><option value="17:00" class="bg-zinc-900">17:00</option><option value="19:00" class="bg-zinc-900">19:00</option><option value="21:00" class="bg-zinc-900">21:00</option></select></div></div><div><label class="text-xs text-zinc-400 font-medium mb-2 block">${T('res_people')}</label><select required class="w-full bg-white/[.03] border border-white/[.08] rounded-xl px-4 py-3 text-sm font-light text-white focus:outline-none focus:border-indigo-500/50" style="color-scheme:dark"><option value="" class="bg-zinc-900">${T('res_people_ph')}</option><option value="1" class="bg-zinc-900">1</option><option value="2" class="bg-zinc-900">2</option><option value="3" class="bg-zinc-900">3</option><option value="4" class="bg-zinc-900">4</option><option value="5" class="bg-zinc-900">5</option><option value="6+" class="bg-zinc-900">6+</option></select></div><div><label class="text-xs text-zinc-400 font-medium mb-2 block">${T('res_note')}</label><textarea rows="3" placeholder="${T('res_note_ph')}" class="w-full bg-white/[.03] border border-white/[.08] rounded-xl px-4 py-3 text-sm font-light text-white placeholder:text-zinc-600 focus:outline-none focus:border-indigo-500/50 resize-none"></textarea></div><button type="submit" class="btn-primary w-full py-3.5 rounded-xl text-sm font-medium flex items-center justify-center gap-2"><span class="iconify" data-icon="ph:calendar-check-bold"></span> ${T('res_btn')}</button></form></div></div></div></div>`;
}

// CTA
function renderCTA(){
    document.getElementById('ctaSection').innerHTML=`<div class="max-w-4xl mx-auto text-center animate-on-scroll"><div class="glass-strong rounded-3xl p-12 sm:p-16 relative overflow-hidden" style="animation:borderGlow 4s ease-in-out infinite"><div class="absolute top-0 right-0 w-64 h-64 rounded-full opacity-10" style="background:radial-gradient(circle,#6366f1,transparent);filter:blur(60px)"></div><div class="absolute bottom-0 left-0 w-48 h-48 rounded-full opacity-10" style="background:radial-gradient(circle,#d946ef,transparent);filter:blur(60px)"></div><div class="relative z-10"><div class="flex justify-center mb-6"><div class="w-16 h-16 rounded-2xl flex items-center justify-center" style="background:linear-gradient(135deg,rgba(99,102,241,.15),rgba(217,70,239,.15))"><span class="text-2xl font-bold" style="background:linear-gradient(135deg,#a5b4fc,#c084fc);-webkit-background-clip:text;-webkit-text-fill-color:transparent">3D</span></div></div><h2 class="text-3xl sm:text-4xl font-semibold tracking-tight mb-4">${T('cta_title')} <span style="background:linear-gradient(to right,#a5b4fc,#c084fc,#f0abfc);-webkit-background-clip:text;-webkit-text-fill-color:transparent">${T('cta_title_highlight')}</span></h2><p class="text-sm font-light text-zinc-400 max-w-md mx-auto mb-8">${T('cta_desc')}</p><div class="flex flex-col sm:flex-row items-center justify-center gap-4"><a href="https://instagram.com/3dcafeporis" target="_blank" class="btn-primary px-8 py-3.5 rounded-full text-sm font-medium inline-flex items-center gap-2"><span class="iconify" data-icon="mdi:instagram"></span> ${T('cta_btn1')}</a><a href="https://wa.me/6281278327756" target="_blank" class="btn-outline px-8 py-3.5 rounded-full text-sm font-medium inline-flex items-center gap-2"><span class="iconify" data-icon="mdi:whatsapp"></span> ${T('cta_btn2')}</a></div></div></div></div>`;
}

// FOOTER
function renderFooter(){
    const navItems=C('footer_nav');const contactItems=C('footer_contact');
    document.getElementById('footerSection').innerHTML=`<div class="max-w-7xl mx-auto"><div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-10 mb-12"><div class="sm:col-span-2 lg:col-span-1"><div class="flex items-center gap-2.5 mb-4"><div class="w-8 h-8 rounded-lg flex items-center justify-center" style="background:linear-gradient(to top right,#6366f1,#d946ef)"><span class="text-white text-[11px] font-bold">3D</span></div><span class="logo-3d">${T('hero_line2')}</span></div><p class="text-xs text-zinc-500 font-light leading-relaxed mb-4">${T('footer_desc')}</p><div class="flex items-center gap-2"><span class="w-1.5 h-1.5 rounded-full bg-emerald-500" style="box-shadow:0 0 8px rgba(16,185,129,.5)"></span><span class="text-xs text-zinc-500 font-light">${T('footer_open')}</span></div></div><div><p class="text-xs font-medium uppercase tracking-wider text-zinc-400 mb-4">${T('footer_nav_title')}</p><ul class="space-y-2.5">${Array.isArray(navItems)?navItems.map(n=>`<li><a href="#menu" class="text-xs text-zinc-500 font-light hover:text-white transition-colors">${n}</a></li>`).join(''):''}</ul></div><div><p class="text-xs font-medium uppercase tracking-wider text-zinc-400 mb-4">${T('footer_hours_title')}</p><ul class="space-y-2.5"><li class="text-xs text-zinc-500 font-light">${T('footer_hours_1')}</li><li class="text-xs text-zinc-400 font-medium">${T('footer_hours_2')}</li></ul></div><div><p class="text-xs font-medium uppercase tracking-wider text-zinc-400 mb-4">${T('footer_contact_title')}</p><ul class="space-y-2.5">${Array.isArray(contactItems)?contactItems.map(c=>`<li class="text-xs text-zinc-500 font-light">${c}</li>`).join(''):''}</ul></div></div><div class="divider mb-8"></div><div class="flex flex-col sm:flex-row items-center justify-between gap-4"><p class="text-xs text-zinc-600 font-light">${T('footer_copy')}</p><p class="text-xs text-zinc-700 font-light">${T('footer_crafted')}</p></div></div></div>`;
}

// ═══════════════════════════════════════════════════
// MUSIC PLAYER
// ═══════════════════════════════════════════════════
const audio=document.getElementById('bgAudio');let isPlaying=false,isMuted=true;
function applyAudio(){const s=document.getElementById('bgmSrc');s.src=C('bgm_url');audio.load();const v=parseInt(C('bgm_volume'))||40;audio.volume=v/100;audio.muted=true;document.getElementById('volSlider').value=v;document.getElementById('volVal').textContent=v+'%'}
function toggleMusic(){const u=C('bgm_url');if(!u){showToast('Belum Ada Musik','Set URL di Admin > Musik.');return}if(isPlaying){audio.pause();isPlaying=false}else{audio.play().then(()=>{isPlaying=true;isMuted=false;audio.muted=false}).catch(()=>showToast('Klik lagi',''))}updateMU()}
function stopMusic(){audio.pause();audio.currentTime=0;isPlaying=false;updateMU()}
function toggleMute(){isMuted=!isMuted;audio.muted=isMuted;if(!isMuted&&!isPlaying)audio.play().then(()=>{isPlaying=true}).catch(()=>{});updateMU()}
function changeVol(v){audio.volume=v/100;document.getElementById('volVal').textContent=v+'%';if(v==0){isMuted=true;audio.muted=true}else if(isMuted){isMuted=false;audio.muted=false}updateMU()}
function updateMU(){const eq=document.getElementById('eqBars'),btn=document.getElementById('musicBtn'),ic=document.getElementById('musicBtnIcon'),st=document.getElementById('musicStatus'),mb=document.getElementById('muteBtn'),vi=document.getElementById('volIcon');if(isPlaying&&!isMuted){eq.className='flex items-end gap-[3px] h-5 eq-playing';btn.style.background='linear-gradient(135deg,rgba(99,102,241,.2),rgba(217,70,239,.2))';btn.style.borderColor='rgba(99,102,241,.3)';btn.style.boxShadow='0 4px 24px rgba(99,102,241,.2)';ic.setAttribute('data-icon','ph:music-notes-simple-fill');ic.style.color='#818cf8';st.textContent='Now Playing';st.style.color='#818cf8';mb.innerHTML='<span class="iconify text-sm" data-icon="ph:speaker-slash-bold"></span> Mute'}else{eq.className='flex items-end gap-[3px] h-5 eq-paused';btn.style.background='rgba(255,255,255,.05)';btn.style.borderColor='rgba(255,255,255,.08)';btn.style.boxShadow='0 4px 20px rgba(0,0,0,.3)';ic.setAttribute('data-icon','ph:music-notes-simple-bold');ic.style.color='#71717a';st.textContent=isMuted?'Muted':'Paused';st.style.color='';mb.innerHTML='<span class="iconify text-sm" data-icon="ph:speaker-high-bold"></span> Unmute'}vi.setAttribute('data-icon',audio.volume*100===0?'ph:speaker-none-bold':audio.volume<.5?'ph:speaker-low-bold':'ph:speaker-high-bold')}
const musicPanel=document.getElementById('musicPanel');let mpo=false;
document.getElementById('musicArea').addEventListener('mouseenter',()=>{mpo=true;musicPanel.classList.add('open')});
document.getElementById('musicArea').addEventListener('mouseleave',()=>{mpo=false;setTimeout(()=>{if(!mpo)musicPanel.classList.remove('open')},300)});

// ═══════════════════════════════════════════════════
// ADMIN PANEL
// ═══════════════════════════════════════════════════
function tryOpen(){if(isAdmin){openSettings();return}document.getElementById('pwModal').classList.add('open');document.getElementById('pwInput').value='';document.getElementById('pwErr').textContent='';setTimeout(()=>document.getElementById('pwInput').focus(),300)}
function closePw(){document.getElementById('pwModal').classList.remove('open')}
function submitPw(e){e.preventDefault();if(document.getElementById('pwInput').value===ADMIN_PASS){isAdmin=true;sessionStorage.setItem('3dcafe_auth','true');closePw();openSettings();showToast('Login Berhasil! 🔓','')}else{const i=document.getElementById('pwInput');i.classList.add('error');document.getElementById('pwErr').textContent='Password salah.';setTimeout(()=>i.classList.remove('error'),600)}}
function logout(){isAdmin=false;sessionStorage.removeItem('3dcafe_auth');closeSettings();showToast('Logged Out 🔒','')}
function openSettings(){document.getElementById('settingsPanel').classList.add('open');document.getElementById('settingsOverlay').classList.add('open');buildTextSlots();buildMenuSlots();buildImageSlots();buildMusicSlots()}
function closeSettings(){document.getElementById('settingsPanel').classList.remove('open');document.getElementById('settingsOverlay').classList.remove('open')}
function switchTab(t,b){document.querySelectorAll('.tab-btn').forEach(x=>x.classList.remove('active'));document.querySelectorAll('.tab-content').forEach(x=>x.classList.remove('active'));b.classList.add('active');document.getElementById('tab-'+t).classList.add('active')}

// Build text slots — ALL text keys
function buildTextSlots(){
    const c=document.getElementById('textSlots');c.innerHTML='';
    const groups=[
        ['🏷️ Navigasi',['nav_1','nav_2','nav_3','nav_4','nav_5','nav_btn']],
        ['🎬 Hero',['hero_badge','hero_line1','hero_line2','hero_subtitle','hero_btn1','hero_btn2']],
        ['📊 Statistik',['stat_1_num','stat_1_label','stat_2_num','stat_2_label','stat_3_num','stat_3_label','stat_4_num','stat_4_label']],
        ['📖 Tentang',['about_tag','about_t1','about_t2','about_p1','about_p2','about_badge_loc','about_badge_sub','about_open','feat_1_t','feat_1_d','feat_2_t','feat_2_d','feat_3_t','feat_3_d','feat_4_t','feat_4_d']],
        ['⭐ Highlights',['hl_section_tag','hl_section_title','hl_section_title_sub','hl_section_desc','hl_1_name','hl_1_price','hl_1_desc','hl_2_name','hl_2_price','hl_2_desc','hl_3_name','hl_3_price','hl_3_desc','hl_4_name','hl_4_price','hl_4_desc','hl_5_name','hl_5_price','hl_5_desc','hl_6_name','hl_6_price','hl_6_desc']],
        ['🍽️ Menu Section',['menu_section_tag','menu_section_title','menu_section_title_sub','menu_filter_all','menu_filter_coffee','menu_filter_sig','menu_filter_drink','menu_filter_food','menu_cat_coffee','menu_cat_signature','menu_cat_tea','menu_cat_beverage','menu_cat_artisan','menu_cat_snack','menu_cat_main']],
        ['🖼️ Galeri',['gal_tag','gal_title','gal_title_sub','gal_1_txt','gal_1_sub','gal_2_txt','gal_3_txt','gal_4_txt','gal_5_txt']],
        ['💬 Testimoni',['test_tag','test_title','test_title_sub','test_1_name','test_1_role','test_1_text','test_2_name','test_2_role','test_2_text','test_3_name','test_3_role','test_3_text','test_review_link']],
        ['📍 Kontak',['contact_tag','contact_t1','contact_t2','contact_desc','contact_loc_label','contact_loc','contact_hour_label','contact_hour_1','contact_hour_2','contact_phone_label','contact_phone','contact_ig','res_title','res_desc','res_name','res_name_ph','res_date','res_time','res_time_ph','res_people','res_people_ph','res_note','res_note_ph','res_btn']],
        ['📢 CTA & Footer',['cta_title','cta_title_highlight','cta_desc','cta_btn1','cta_btn2','footer_desc','footer_open','footer_nav_title','footer_hours_title','footer_hours_1','footer_hours_2','footer_contact_title','footer_copy','footer_crafted']],
    ];
    groups.forEach(([title,keys])=>{
        let h=`<div class="section-label">${title}</div>`;
        keys.forEach(k=>{
            const def=DEFAULT_CONFIG[k];const isArr=Array.isArray(def);
            h+=`<div class="mb-2"><label class="text-[10px] text-zinc-500 mb-1 block font-mono">${k}</label>`;
            if(isArr) h+=`<input class="text-edit-input" data-key="${k}" value="${JSON.stringify(saved[k]||def)}" onfocus="this.select()">`;
            else h+=`<input class="text-edit-input" data-key="${k}" value="${saved[k]!==undefined?saved[k]:def}" placeholder="${def||''}" onfocus="this.select()">`;
            h+=`</div>`;
        });
        c.innerHTML+=h;
    });
}

// Build menu edit slots
function buildMenuSlots(){
    const c=document.getElementById('menuSlots');c.innerHTML='';
    const cats=[
        {key:'menu_coffee',label:'☕ Essential Coffee'},
        {key:'menu_signature',label:'⭐ Signature Drink'},
        {key:'menu_tea',label:'🍵 Tea Based'},
        {key:'menu_beverage',label:'🧋 Other Beverage'},
        {key:'menu_artisan',label:'🍵 Artisan Tea'},
        {key:'menu_snack',label:'🍟 Snack'},
        {key:'menu_main',label:'🍝 Main Course'},
    ];
    cats.forEach(cat=>{
        const items=JSON.parse(JSON.stringify(saved[cat.key]||DEFAULT_CONFIG[cat.key]||[]));
        let h=`<div class="section-label">${cat.label} <span class="text-zinc-600 font-normal">(${cat.key})</span></div>`;
        if(!Array.isArray(items)){c.innerHTML+=h;return}
        items.forEach((it,idx)=>{
            h+=`<div class="glass rounded-lg p-3 mb-2"><div class="menu-item-edit"><input class="text-edit-input" data-menukey="${cat.key}" data-idx="${idx}" data-field="n" value="${it.n||''}" placeholder="Nama menu" onfocus="this.select()"><input class="text-edit-input price-input" data-menukey="${cat.key}" data-idx="${idx}" data-field="p" value="${it.p||''}" placeholder="Harga" onfocus="this.select()"></div><div class="menu-item-edit"><input class="text-edit-input" data-menukey="${cat.key}" data-idx="${idx}" data-field="d" value="${it.d||''}" placeholder="Deskripsi (opsional)" onfocus="this.select()"><input class="text-edit-input price-input" data-menukey="${cat.key}" data-idx="${idx}" data-field="badge" value="${it.badge||''}" placeholder="Badge (opsional)" onfocus="this.select()"></div></div>`;
        });
        c.innerHTML+=h;
    });
}

// Build image slots
function buildImageSlots(){
    const c=document.getElementById('imageSlots');c.innerHTML='';
    Object.keys(IMAGE_LABELS).forEach(k=>{
        const shape=IMAGE_SHAPES[k]||'wide';const pc=shape==='square'?'img-preview-square':shape==='tall'?'img-preview-tall':'img-preview';
        c.innerHTML+=`<div class="img-slot p-4"><div class="flex items-center justify-between mb-3"><span class="text-xs font-medium text-zinc-300">${IMAGE_LABELS[k]}</span><span class="text-[10px] text-zinc-600 font-mono">${k}</span></div><img src="${C(k)}" alt="" class="${pc} mb-3" id="prev-${k}" onerror="this.style.background='#18181b'"><input type="text" placeholder="Paste URL..." value="${saved[k]||''}" data-imgkey="${k}" oninput="const p=document.getElementById('prev-${k}');if(p&&this.value.trim())p.src=this.value.trim();else if(p)p.src=DEFAULT_CONFIG[k]||''" onfocus="this.select()"></div>`;
    });
}

function buildMusicSlots(){
    document.getElementById('bgmUrlIn').value=saved.bgm_url||'';
    const v=saved.bgm_volume||DEFAULT_CONFIG.bgm_volume||'40';document.getElementById('bgmVolIn').value=v;document.getElementById('bgmVolLbl').textContent=v+'%';
}

// Save all
function saveAll(){
    const nc={};
    // Text fields
    document.querySelectorAll('[data-key]').forEach(i=>{const k=i.getAttribute('data-key');const v=i.value.trim();if(v){try{nc[k]=JSON.parse(v)}catch(e){nc[k]=v}}});
    // Menu items
    const menuData={};
    document.querySelectorAll('[data-menukey]').forEach(i=>{
        const mk=i.getAttribute('data-menukey');const idx=parseInt(i.getAttribute('data-idx'));const f=i.getAttribute('data-field');
        if(!menuData[mk])menuData[mk]=[];
        while(menuData[mk].length<=idx)menuData[mk].push({});
        const val=i.value.trim();if(val)menuData[mk][idx][f]=val;
    });
    Object.keys(menuData).forEach(k=>{if(menuData[k].length)nc[k]=menuData[k]});
    // Images
    document.querySelectorAll('[data-imgkey]').forEach(i=>{if(i.value.trim())nc[i.getAttribute('data-imgkey')]=i.value.trim()});
    // Music
    const bu=document.getElementById('bgmUrlIn').value.trim();if(bu)nc.bgm_url=bu;
    nc.bgm_volume=document.getElementById('bgmVolIn').value;
    if(!Object.keys(nc).length){showToast('Tidak Ada Perubahan','');return}
    saved={...saved,...nc};localStorage.setItem('3dcafe_cfg',JSON.stringify(saved));
    renderAll();showToast('Disimpan! ✨',Object.keys(nc).length+' perubahan diterapkan.');
}
function resetAll(){saved={};localStorage.removeItem('3dcafe_cfg');renderAll();showToast('Direset! 🔄','')}
function exportCfg(){if(!Object.keys(saved).length){showToast('Kosong','');return}const b=new Blob([JSON.stringify(saved,null,2)],{type:'application/json'});const u=URL.createObjectURL(b);const a=document.createElement('a');a.href=u;a.download='3dcafe-config.json';a.click();URL.revokeObjectURL(u);showToast('Export Berhasil! 📁','')}
function importCfg(e){const f=e.target.files[0];if(!f)return;const r=new FileReader();r.onload=function(ev){try{const d=JSON.parse(ev.target.result);saved={...saved,...d};localStorage.setItem('3dcafe_cfg',JSON.stringify(saved));renderAll();showToast('Import Berhasil! 📥','')}catch(err){showToast('Gagal Import','')}};r.readAsText(f);e.target.value=''}

// ═══════════════════════════════════════════════════
// UTILITIES
// ═══════════════════════════════════════════════════
function showToast(t,m){const el=document.getElementById('toast');document.getElementById('toastTitle').textContent=t;document.getElementById('toastMsg').textContent=m;el.classList.add('show');setTimeout(()=>el.classList.remove('show'),4000)}
function handleRes(e){e.preventDefault();showToast('Reservasi Terkirim! 🎉','Kami akan konfirmasi via WhatsApp.');e.target.reset()}
window.addEventListener('scroll',()=>{const n=document.getElementById('navbar');if(window.pageYOffset>50){n.style.background='rgba(9,9,11,.85)';n.style.backdropFilter='blur(20px)';n.style.borderBottom='1px solid rgba(255,255,255,.05)'}else{n.style.background='transparent';n.style.backdropFilter='none';n.style.borderBottom='none'}});
function toggleMobile(){document.getElementById('mobileMenu').classList.toggle('open');document.body.style.overflow=document.getElementById('mobileMenu').classList.contains('open')?'hidden':''}
const obs=new IntersectionObserver(e=>{e.forEach(en=>{if(en.isIntersecting)en.target.classList.add('visible')})},{threshold:.1,rootMargin:'0px 0px -50px 0px'});
function filterMenu(cat,btn){document.querySelectorAll('.cat-btn').forEach(b=>b.classList.remove('active'));btn.classList.add('active');document.querySelectorAll('.menu-category').forEach(c=>{if(cat==='all'||c.getAttribute('data-cat')===cat){c.style.display='';c.style.opacity='0';c.style.transform='translateY(15px)';setTimeout(()=>{c.style.transition='all .5s cubic-bezier(.16,1,.3,1)';c.style.opacity='1';c.style.transform='translateY(0)'},30)}else{c.style.display='none'}})}
document.addEventListener('keydown',e=>{if(e.ctrlKey&&e.shiftKey&&e.key==='G'){e.preventDefault();tryOpen()}if(e.key==='Escape'){closePw();closeSettings()}});

// INIT
renderAll();
</script>
</body>
</html>
