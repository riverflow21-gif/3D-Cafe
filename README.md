
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
        ::-webkit-scrollbar{width:6px}
        ::-webkit-scrollbar-track{background:#09090b}
        ::-webkit-scrollbar-thumb{background:#6366f1;border-radius:3px}
        html{scroll-behavior:smooth}

        @keyframes fadeInUp{from{opacity:0;transform:translateY(30px)}to{opacity:1;transform:translateY(0)}}
        @keyframes float{0%,100%{transform:translateY(0)}50%{transform:translateY(-10px)}}
        @keyframes floatSlow{0%,100%{transform:translateY(0) rotate(0deg)}50%{transform:translateY(-15px) rotate(3deg)}}
        @keyframes pulse-glow{0%,100%{box-shadow:0 0 20px rgba(99,102,241,0.1)}50%{box-shadow:0 0 40px rgba(99,102,241,0.25)}}
        @keyframes grain{0%,100%{transform:translate(0,0)}10%{transform:translate(-5%,-10%)}30%{transform:translate(3%,-15%)}50%{transform:translate(12%,9%)}70%{transform:translate(9%,4%)}90%{transform:translate(-1%,7%)}}
        @keyframes shimmer{0%{background-position:-200% 0}100%{background-position:200% 0}}
        @keyframes marquee{0%{transform:translateX(0)}100%{transform:translateX(-50%)}}
        @keyframes spin-slow{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
        @keyframes dash{to{stroke-dashoffset:0}}
        @keyframes borderGlow{0%,100%{border-color:rgba(99,102,241,0.2)}50%{border-color:rgba(217,70,239,0.3)}}
        @keyframes blob{0%,100%{border-radius:60% 40% 30% 70%/60% 30% 70% 40%}50%{border-radius:30% 60% 70% 40%/50% 60% 30% 60%}}
        @keyframes countUp{from{opacity:0;transform:translateY(10px)}to{opacity:1;transform:translateY(0)}}
        @keyframes rotateIn{from{opacity:0;transform:rotate(-10deg) scale(0.9)}to{opacity:1;transform:rotate(0) scale(1)}}
        @keyframes waveFloat{0%,100%{transform:translateY(0) translateX(0)}25%{transform:translateY(-5px) translateX(3px)}50%{transform:translateY(-10px) translateX(0)}75%{transform:translateY(-5px) translateX(-3px)}}

        .grain-overlay::before{content:'';position:fixed;top:-50%;left:-50%;width:200%;height:200%;background-image:url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");animation:grain 8s steps(10) infinite;pointer-events:none;z-index:9999;opacity:0.4}

        .animate-on-scroll{opacity:0;transform:translateY(30px);transition:all 0.8s cubic-bezier(0.16,1,0.3,1)}
        .animate-on-scroll.visible{opacity:1;transform:translateY(0)}
        .d1{transition-delay:.1s}.d2{transition-delay:.2s}.d3{transition-delay:.3s}.d4{transition-delay:.4s}.d5{transition-delay:.5s}.d6{transition-delay:.6s}

        .hero-title{animation:fadeInUp .8s cubic-bezier(.16,1,.3,1) forwards}
        .hero-sub{animation:fadeInUp .8s cubic-bezier(.16,1,.3,1) .15s forwards;opacity:0}
        .hero-cta{animation:fadeInUp .8s cubic-bezier(.16,1,.3,1) .3s forwards;opacity:0}
        .hero-badge{animation:fadeInUp .8s cubic-bezier(.16,1,.3,1) .05s forwards;opacity:0}

        .glass{background:rgba(255,255,255,0.03);backdrop-filter:blur(12px);border:1px solid rgba(255,255,255,0.06)}
        .glass-strong{background:rgba(255,255,255,0.05);backdrop-filter:blur(20px);border:1px solid rgba(255,255,255,0.08)}

        .menu-card{transition:all .5s cubic-bezier(.16,1,.3,1)}
        .menu-card:hover{transform:translateY(-4px);background:rgba(255,255,255,0.06)}
        .menu-card:hover .menu-img{transform:scale(1.08)}
        .menu-card .menu-img{transition:transform .6s cubic-bezier(.16,1,.3,1)}

        .gallery-item{transition:all .5s cubic-bezier(.16,1,.3,1)}
        .gallery-item:hover{transform:scale(1.02)}
        .gallery-item:hover .gallery-overlay{opacity:1}
        .gallery-overlay{transition:opacity .4s ease}

        .nav-link{position:relative;transition:color .3s ease}
        .nav-link::after{content:'';position:absolute;bottom:-4px;left:0;width:0;height:1px;background:linear-gradient(to right,#6366f1,#d946ef);transition:width .3s ease}
        .nav-link:hover{color:#fff}
        .nav-link:hover::after{width:100%}

        .btn-primary{background:#fff;color:#000;transition:all .3s ease;box-shadow:0 0 20px rgba(255,255,255,0.1)}
        .btn-primary:hover{box-shadow:0 0 30px rgba(255,255,255,0.2);transform:scale(1.02)}
        .btn-primary:active{transform:scale(.98)}
        .btn-outline{border:1px solid rgba(255,255,255,0.15);color:#fff;transition:all .3s ease}
        .btn-outline:hover{border-color:rgba(255,255,255,0.3);background:rgba(255,255,255,0.05)}

        .cat-btn{transition:all .3s ease}
        .cat-btn.active{background:rgba(99,102,241,0.15);color:#818cf8;border-color:rgba(99,102,241,0.3)}

        .testimonial-card{transition:all .5s cubic-bezier(.16,1,.3,1)}
        .testimonial-card:hover{transform:translateY(-2px);background:rgba(255,255,255,0.05)}

        .mobile-menu{transform:translateX(100%);transition:transform .4s cubic-bezier(.16,1,.3,1)}
        .mobile-menu.open{transform:translateX(0)}

        .divider{height:1px;background:linear-gradient(to right,transparent,rgba(255,255,255,0.08),transparent)}
        .float-1{animation:float 6s ease-in-out infinite}
        .float-2{animation:float 6s ease-in-out 1s infinite}
        .float-3{animation:float 6s ease-in-out 2s infinite}

        .toast{position:fixed;bottom:30px;left:50%;transform:translateX(-50%) translateY(100px);z-index:10000;transition:transform .5s cubic-bezier(.16,1,.3,1),opacity .5s ease;opacity:0;pointer-events:none}
        .toast.show{transform:translateX(-50%) translateY(0);opacity:1;pointer-events:auto}

        .menu-list-item{transition:all .3s ease;border-bottom:1px solid rgba(255,255,255,0.04)}
        .menu-list-item:hover{background:rgba(255,255,255,0.03);padding-left:20px}
        .menu-list-item:last-child{border-bottom:none}

        .logo-3d{font-weight:700;font-size:18px;letter-spacing:-0.5px;background:linear-gradient(135deg,#a5b4fc,#fff,#c084fc);-webkit-background-clip:text;-webkit-text-fill-color:transparent;position:relative}
        .logo-3d::after{content:'3D';position:absolute;left:0;top:0;background:linear-gradient(135deg,rgba(99,102,241,0.3),rgba(217,70,239,0.3));-webkit-background-clip:text;-webkit-text-fill-color:transparent;filter:blur(8px);z-index:-1}

        .price-tag{font-family:'JetBrains Mono',monospace;font-size:13px;color:#818cf8}

        .category-header{position:relative;padding-left:16px}
        .category-header::before{content:'';position:absolute;left:0;top:50%;transform:translateY(-50%);width:4px;height:20px;border-radius:2px;background:linear-gradient(to bottom,#6366f1,#d946ef)}

        .star-badge{background:linear-gradient(135deg,rgba(245,158,11,0.15),rgba(239,68,68,0.1));border:1px solid rgba(245,158,11,0.2)}

        /* Marquee */
        .marquee-track{display:flex;animation:marquee 30s linear infinite;width:max-content}
        .marquee-track:hover{animation-play-state:paused}

        /* Decorative */
        .deco-blob{animation:blob 8s ease-in-out infinite;opacity:0.04}
        .deco-ring{animation:spin-slow 20s linear infinite}
        .deco-dots{background-image:radial-gradient(rgba(255,255,255,0.08) 1px,transparent 1px);background-size:20px 20px}

        /* Stats counter */
        .stat-number{font-variant-numeric:tabular-nums}

        /* Settings Panel */
        .settings-panel{position:fixed;top:0;right:0;width:420px;max-width:100vw;height:100vh;background:rgba(9,9,11,0.98);backdrop-filter:blur(30px);border-left:1px solid rgba(255,255,255,0.08);z-index:10001;transform:translateX(100%);transition:transform .4s cubic-bezier(.16,1,.3,1);overflow-y:auto}
        .settings-panel.open{transform:translateX(0)}
        .settings-panel::-webkit-scrollbar{width:4px}
        .settings-panel::-webkit-scrollbar-thumb{background:#333;border-radius:2px}
        .settings-overlay{position:fixed;inset:0;background:rgba(0,0,0,0.6);z-index:10000;opacity:0;pointer-events:none;transition:opacity .3s ease}
        .settings-overlay.open{opacity:1;pointer-events:auto}

        .img-slot{transition:all .3s ease;border:1px solid rgba(255,255,255,0.06);border-radius:12px;overflow:hidden}
        .img-slot:hover{border-color:rgba(99,102,241,0.3)}
        .img-slot input,.text-edit-input{background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);border-radius:8px;padding:8px 12px;color:#fff;font-size:12px;width:100%;outline:none;font-family:'Inter',sans-serif;transition:border-color .3s}
        .img-slot input:focus,.text-edit-input:focus{border-color:rgba(99,102,241,0.5)}
        .img-slot input::placeholder,.text-edit-input::placeholder{color:#52525b}
        .img-preview{width:100%;aspect-ratio:16/10;object-fit:cover;border-radius:8px;background:rgba(255,255,255,0.03)}
        .img-preview-square{width:100%;aspect-ratio:1;object-fit:cover;border-radius:8px;background:rgba(255,255,255,0.03)}
        .img-preview-tall{width:100%;aspect-ratio:3/4;object-fit:cover;border-radius:8px;background:rgba(255,255,255,0.03)}
        .reset-btn{transition:all .3s ease}
        .reset-btn:hover{background:rgba(239,68,68,0.15);border-color:rgba(239,68,68,0.3);color:#f87171}

        /* Password Modal */
        .pw-modal{position:fixed;inset:0;z-index:10002;display:flex;align-items:center;justify-content:center;background:rgba(0,0,0,0.7);backdrop-filter:blur(10px);opacity:0;pointer-events:none;transition:opacity .3s ease}
        .pw-modal.open{opacity:1;pointer-events:auto}
        .pw-modal .modal-box{transform:scale(0.9);transition:transform .4s cubic-bezier(.16,1,.3,1)}
        .pw-modal.open .modal-box{transform:scale(1)}
        .pw-input{background:rgba(255,255,255,0.05);border:1px solid rgba(255,255,255,0.1);border-radius:12px;padding:14px 18px;color:#fff;font-size:14px;width:100%;outline:none;font-family:'Inter',sans-serif;letter-spacing:2px;text-align:center;transition:all .3s}
        .pw-input:focus{border-color:rgba(99,102,241,0.5);box-shadow:0 0 20px rgba(99,102,241,0.1)}
        .pw-input.error{border-color:rgba(239,68,68,0.5);animation:shake .5s ease}
        @keyframes shake{0%,100%{transform:translateX(0)}20%,60%{transform:translateX(-8px)}40%,80%{transform:translateX(8px)}}

        .settings-toggle{position:fixed;bottom:24px;left:24px;z-index:40}
        .settings-toggle button{width:44px;height:44px;cursor:pointer;display:flex;align-items:center;justify-content:center;background:rgba(255,255,255,0.05);backdrop-filter:blur(12px);border:1px solid rgba(255,255,255,0.08);border-radius:50%;color:#71717a;transition:all .3s ease;font-size:18px}
        .settings-toggle button:hover{color:#fff;background:rgba(255,255,255,0.1);border-color:rgba(99,102,241,0.3)}

        /* Tab navigation in settings */
        .tab-btn{transition:all .3s ease;padding:8px 16px;border-radius:8px;font-size:12px;font-weight:500;color:#71717a}
        .tab-btn.active{background:rgba(99,102,241,0.15);color:#818cf8}
        .tab-btn:hover:not(.active){color:#a1a1aa}
        .tab-content{display:none}
        .tab-content.active{display:block}

        /* Decorative corner accents */
        .corner-accent{position:absolute;width:40px;height:40px;opacity:0.1}
        .corner-accent::before,.corner-accent::after{content:'';position:absolute;background:linear-gradient(to right,#6366f1,#d946ef)}
        .corner-tl::before{top:0;left:0;width:20px;height:1px}
        .corner-tl::after{top:0;left:0;width:1px;height:20px}
        .corner-br::before{bottom:0;right:0;width:20px;height:1px}
        .corner-br::after{bottom:0;right:0;width:1px;height:20px}

        /* Section decoration line */
        .section-deco{display:flex;align-items:center;gap:12px;justify-content:center;margin-bottom:48px}
        .section-deco .line{width:60px;height:1px;background:linear-gradient(to right,transparent,rgba(99,102,241,0.3))}
        .section-deco .diamond{width:6px;height:6px;transform:rotate(45deg);background:linear-gradient(135deg,#6366f1,#d946ef);opacity:0.5}

        .editable-text{transition:background .2s}
    </style>
</head>
<body class="grain-overlay">

<!-- ============================================================
     ⚙️ DEFAULT CONFIGURATION
     ============================================================ -->
<script>
const DEFAULT_CONFIG = {
    // ── Text Content ──
    cafe_name: "3D Cafe",
    hero_subtitle: "Kopi, makanan, dan suasana yang bikin betah. Temukan pengalaman ngopi terbaik di Poris Indah, Tangerang.",
    about_title: "Lebih dari Sekedar",
    about_title_sub: "Tempat Ngopi",
    about_text_1: "3D Cafe hadir di kawasan Poris Indah, Cipondoh sebagai tempat nongkrong yang nyaman dengan konsep modern dan cozy. Kami menyajikan beragam menu kopi, minuman kekinian, hingga makanan berat yang menggugah selera.",
    about_text_2: "Dengan harga yang ramah di kantong mulai dari 7 ribuan, 3D Cafe jadi destinasi favorit buat hangout bareng teman, kerja, atau sekedar melepas penat setelah aktivitas.",
    feature_1_title: "55+ Menu",
    feature_1_desc: "Kopi, non-kopi & makanan",
    feature_2_title: "Harga Terjangkau",
    feature_2_desc: "Mulai dari Rp 7.000",
    feature_3_title: "Buka Lama",
    feature_3_desc: "Sampai 23:30 setiap hari",
    feature_4_title: "Free WiFi",
    feature_4_desc: "Cocok buat kerja & nongkrong",

    // ── Images ──
    about_main: "https://lh3.googleusercontent.com/gps-cs-s/APNQkAFZrxBxYNXw_wWwWidTGbk489nni3TjGVHNfjGhLXFDK6Sdgj1_pmBAb2XdSFjsOgWjEH_AGAdfM4ZgLdiuICDCzbEUVkHFvV4JM69WRzGBGpG02WCfhYrfytDUiKVprUMkXXD0=w800-h1067-n-k-no-nu",
    highlight_1: "https://picsum.photos/seed/es-kopi-susu-3d/600/375.jpg",
    highlight_2: "https://picsum.photos/seed/ice-tiramisu-latte/600/375.jpg",
    highlight_3: "https://picsum.photos/seed/pandan-latte-drink/600/375.jpg",
    highlight_4: "https://picsum.photos/seed/triple-peach-americano/600/375.jpg",
    highlight_5: "https://picsum.photos/seed/rice-bowl-cafe-food/600/375.jpg",
    highlight_6: "https://picsum.photos/seed/spaghetti-carbonara-plate/600/375.jpg",
    gallery_1: "https://lh3.googleusercontent.com/gps-cs-s/APNQkAFZrxBxYNXw_wWwWidTGbk489nni3TjGVHNfjGhLXFDK6Sdgj1_pmBAb2XdSFjsOgWjEH_AGAdfM4ZgLdiuICDCzbEUVkHFvV4JM69WRzGBGpG02WCfhYrfytDUiKVprUMkXXD0=w800-h1067-n-k-no-nu",
    gallery_2: "https://lh3.googleusercontent.com/gps-cs-s/APNQkAFe-IjRqXL18ORjGOmGaH9XBTr5_2jfCsdiqyiZAMMPcTRkq6bHaGqW5-Eao6zXIDiVspfvDY8A-qRlaAa0vVoApambxpO16mgqnR_KytW7GnKC_aiXuCmf6PaAB3cBjTHLP6py=w800-h1067-n-k-no-nu",
    gallery_3: "https://lh3.googleusercontent.com/gps-cs-s/APNQkAH-iAYnz7NsZqzpo6X-ffxnHoWQZIY_pYGQ95Q2WEHusqE81w4tzqJf1q8wPbqNGoTIWV3jJ9RAVK5zaKBxnzOYL74Y8pjFPyhPnzs4fub77t0Wo9pwGpavEbXYhpMwpF96OopUFvdu9QY=w800-h800-n-k-no-nu",
    gallery_4: "https://picsum.photos/seed/3d-cafe-drinks-display/400/400.jpg",
    gallery_5: "https://picsum.photos/seed/3d-cafe-food-table/400/400.jpg",

    // ── Highlight Cards ──
    hl_1_name: "Es Kopi Susu", hl_1_price: "23K", hl_1_desc: "Signature drink andalan 3D Cafe — kopi susu yang creamy dan pas rasa manisnya.",
    hl_2_name: "Ice Tiramisu Latte", hl_2_price: "23K", hl_2_desc: "Perpaduan kopi dan rasa tiramisu yang unik, jadi favorit banyak pelanggan.",
    hl_3_name: "Pandan Latte", hl_3_price: "23K", hl_3_desc: "Latte dengan aroma pandan khas Indonesia, fresh dan aromatic.",
    hl_4_name: "Triple Peach Americano", hl_4_price: "24K", hl_4_desc: "Kopi unik dengan rasa peach fruity yang menyegarkan, beda dari yang lain.",
    hl_5_name: "Rice Bowl", hl_5_price: "26K", hl_5_desc: "Ayam + telur + saus creamy + jamur di atas nasi hangat. Puas dan mengenyangkan.",
    hl_6_name: "Spaghetti Carbonara", hl_6_price: "29K", hl_6_desc: "Carbonara creamy dengan bacon yang gurih, favorit menu main course.",
};

const IMAGE_LABELS = {
    about_main: "📸 Foto Utama (About)",
    highlight_1: "☕ Es Kopi Susu", highlight_2: "☕ Ice Tiramisu Latte", highlight_3: "☕ Pandan Latte",
    highlight_4: "☕ Triple Peach Americano", highlight_5: "🍛 Rice Bowl", highlight_6: "🍝 Spaghetti Carbonara",
    gallery_1: "🖼️ Galeri — Interior Utama", gallery_2: "🖼️ Galeri — Sudut Nongkrong",
    gallery_3: "🖼️ Galeri — Detail Interior", gallery_4: "🖼️ Galeri — Display Minuman", gallery_5: "🖼️ Galeri — Menu Makanan",
};
const IMAGE_SHAPES = {
    about_main:"tall", gallery_1:"tall", gallery_2:"square", gallery_3:"square", gallery_4:"square", gallery_5:"square",
};
const TEXT_LABELS = {
    cafe_name:"🏷️ Nama Cafe",
    hero_subtitle:"📝 Subtitle Hero",
    about_title:"📖 Judul About (Baris 1)", about_title_sub:"📖 Judul About (Baris 2)",
    about_text_1:"📄 Paragraf About 1", about_text_2:"📄 Paragraf About 2",
    feature_1_title:"✨ Fitur 1 — Judul", feature_1_desc:"✨ Fitur 1 — Deskripsi",
    feature_2_title:"✨ Fitur 2 — Judul", feature_2_desc:"✨ Fitur 2 — Deskripsi",
    feature_3_title:"✨ Fitur 3 — Judul", feature_3_desc:"✨ Fitur 3 — Deskripsi",
    feature_4_title:"✨ Fitur 4 — Judul", feature_4_desc:"✨ Fitur 4 — Deskripsi",
    hl_1_name:"☕ Menu 1 — Nama", hl_1_price:"☕ Menu 1 — Harga", hl_1_desc:"☕ Menu 1 — Deskripsi",
    hl_2_name:"☕ Menu 2 — Nama", hl_2_price:"☕ Menu 2 — Harga", hl_2_desc:"☕ Menu 2 — Deskripsi",
    hl_3_name:"☕ Menu 3 — Nama", hl_3_price:"☕ Menu 3 — Harga", hl_3_desc:"☕ Menu 3 — Deskripsi",
    hl_4_name:"☕ Menu 4 — Nama", hl_4_price:"☕ Menu 4 — Harga", hl_4_desc:"☕ Menu 4 — Deskripsi",
    hl_5_name:"☕ Menu 5 — Nama", hl_5_price:"☕ Menu 5 — Harga", hl_5_desc:"☕ Menu 5 — Deskripsi",
    hl_6_name:"☕ Menu 6 — Nama", hl_6_price:"☕ Menu 6 — Harga", hl_6_desc:"☕ Menu 6 — Deskripsi",
};

// Load saved
let savedConfig = {};
try { savedConfig = JSON.parse(localStorage.getItem('3dcafe_config') || '{}'); } catch(e) {}
function C(key) { return savedConfig[key] || DEFAULT_CONFIG[key] || ''; }

// Auth
const ADMIN_PASS = "3DxCafe";
let isAdmin = sessionStorage.getItem('3dcafe_auth') === 'true';
</script>

<!-- Ambient Background -->
<div class="fixed inset-0 pointer-events-none" style="z-index:0">
    <div class="absolute top-0 left-1/4 w-[800px] h-[500px] rounded-full opacity-[0.07]" style="background:radial-gradient(circle,#6366f1 0%,transparent 70%);filter:blur(120px)"></div>
    <div class="absolute bottom-0 right-1/4 w-[600px] h-[600px] rounded-full opacity-[0.05]" style="background:radial-gradient(circle,#d946ef 0%,transparent 70%);filter:blur(100px)"></div>
    <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[400px] h-[400px] rounded-full opacity-[0.03]" style="background:radial-gradient(circle,#f59e0b 0%,transparent 70%);filter:blur(100px)"></div>
</div>

<!-- Navigation -->
<nav class="fixed top-0 left-0 right-0 z-50 transition-all duration-500" id="navbar">
    <div class="max-w-7xl mx-auto px-6 h-16 flex items-center justify-between">
        <a href="#" class="flex items-center gap-2.5">
            <div class="w-8 h-8 rounded-lg flex items-center justify-center" style="background:linear-gradient(to top right,#6366f1,#d946ef)">
                <span class="text-white text-[11px] font-bold" style="text-shadow:0 0 10px rgba(255,255,255,0.3)">3D</span>
            </div>
            <span class="logo-3d editable-text" data-key="cafe_name"></span>
        </a>
        <div class="hidden md:flex items-center gap-8">
            <a href="#about" class="nav-link text-sm font-light text-zinc-400">Tentang</a>
            <a href="#highlights" class="nav-link text-sm font-light text-zinc-400">Favorit</a>
            <a href="#menu" class="nav-link text-sm font-light text-zinc-400">Menu</a>
            <a href="#gallery" class="nav-link text-sm font-light text-zinc-400">Galeri</a>
            <a href="#contact" class="nav-link text-sm font-light text-zinc-400">Kontak</a>
        </div>
        <div class="hidden md:flex items-center gap-3">
            <a href="https://wa.me/6281278327756" target="_blank" class="btn-primary px-5 py-2 rounded-full text-xs font-medium inline-flex items-center gap-1.5">
                <span class="iconify text-sm" data-icon="mdi:whatsapp"></span> Pesan
            </a>
        </div>
        <button class="md:hidden w-10 h-10 flex items-center justify-center rounded-lg glass" onclick="toggleMobile()">
            <span class="iconify text-xl" data-icon="ph:list-bold"></span>
        </button>
    </div>
</nav>

<!-- Mobile Menu -->
<div class="mobile-menu fixed inset-0 z-50 bg-[#09090b]/95 backdrop-blur-xl flex flex-col" id="mobileMenu">
    <div class="px-6 h-16 flex items-center justify-between">
        <div class="flex items-center gap-2.5">
            <div class="w-8 h-8 rounded-lg flex items-center justify-center" style="background:linear-gradient(to top right,#6366f1,#d946ef)"><span class="text-white text-[11px] font-bold">3D</span></div>
            <span class="logo-3d editable-text" data-key="cafe_name"></span>
        </div>
        <button class="w-10 h-10 flex items-center justify-center rounded-lg glass" onclick="toggleMobile()"><span class="iconify text-xl" data-icon="ph:x-bold"></span></button>
    </div>
    <div class="flex-1 flex flex-col items-center justify-center gap-8">
        <a href="#about" onclick="toggleMobile()" class="text-2xl font-light text-zinc-300 hover:text-white transition-colors">Tentang</a>
        <a href="#highlights" onclick="toggleMobile()" class="text-2xl font-light text-zinc-300 hover:text-white transition-colors">Favorit</a>
        <a href="#menu" onclick="toggleMobile()" class="text-2xl font-light text-zinc-300 hover:text-white transition-colors">Menu</a>
        <a href="#gallery" onclick="toggleMobile()" class="text-2xl font-light text-zinc-300 hover:text-white transition-colors">Galeri</a>
        <a href="#contact" onclick="toggleMobile()" class="text-2xl font-light text-zinc-300 hover:text-white transition-colors">Kontak</a>
        <a href="https://wa.me/6281278327756" target="_blank" onclick="toggleMobile()" class="btn-primary px-8 py-3 rounded-full text-sm font-medium mt-4 inline-flex items-center gap-2"><span class="iconify" data-icon="mdi:whatsapp"></span> Pesan via WhatsApp</a>
    </div>
</div>

<!-- ==================== HERO ==================== -->
<section class="relative min-h-screen flex items-center justify-center px-6" style="padding-top:64px">
    <!-- Decorative blobs -->
    <div class="absolute top-20 right-[10%] w-[300px] h-[300px] deco-blob pointer-events-none" style="background:linear-gradient(135deg,#6366f1,#d946ef)"></div>
    <div class="absolute bottom-32 left-[5%] w-[200px] h-[200px] deco-blob pointer-events-none" style="background:linear-gradient(135deg,#f59e0b,#ef4444);animation-delay:4s"></div>

    <!-- Decorative rings -->
    <div class="absolute top-1/4 left-[8%] deco-ring pointer-events-none opacity-[0.03]">
        <svg width="120" height="120" viewBox="0 0 120 120"><circle cx="60" cy="60" r="55" fill="none" stroke="url(#g1)" stroke-width="0.5" stroke-dasharray="4 4"/><defs><linearGradient id="g1" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#6366f1"/><stop offset="100%" stop-color="#d946ef"/></linearGradient></defs></svg>
    </div>
    <div class="absolute bottom-1/3 right-[6%] deco-ring pointer-events-none opacity-[0.03]" style="animation-direction:reverse;animation-duration:15s">
        <svg width="80" height="80" viewBox="0 0 80 80"><circle cx="40" cy="40" r="35" fill="none" stroke="#f59e0b" stroke-width="0.5" stroke-dasharray="2 6"/></svg>
    </div>

    <div class="max-w-5xl mx-auto text-center relative z-10">
        <div class="hero-badge inline-flex items-center gap-2 px-4 py-1.5 rounded-full glass mb-8">
            <span class="w-1.5 h-1.5 rounded-full bg-emerald-500" style="box-shadow:0 0 8px rgba(16,185,129,0.6)"></span>
            <span class="text-[10px] font-medium uppercase tracking-wider text-zinc-400">Buka Setiap Hari 11:00 — 23:30</span>
        </div>
        <h1 class="hero-title text-5xl sm:text-6xl lg:text-8xl font-bold tracking-tight leading-[1.05] mb-6">
            <span class="block">Welcome to</span>
            <span class="block editable-text" data-key="cafe_name" style="background:linear-gradient(135deg,#a5b4fc 0%,#fff 30%,#c084fc 60%,#f0abfc 100%);-webkit-background-clip:text;-webkit-text-fill-color:transparent;animation:shimmer 4s linear infinite;background-size:200% auto;font-size:inherit;font-weight:inherit;line-height:inherit;letter-spacing:inherit"></span>
        </h1>
        <p class="hero-sub text-base sm:text-lg font-light text-zinc-400 max-w-xl mx-auto mb-10 leading-relaxed editable-text" data-key="hero_subtitle"></p>
        <div class="hero-cta flex flex-col sm:flex-row items-center justify-center gap-4">
            <a href="#menu" class="btn-primary px-8 py-3.5 rounded-full text-sm font-medium inline-flex items-center gap-2">Lihat Menu <span class="iconify text-base" data-icon="ph:arrow-down-bold"></span></a>
            <a href="https://maps.google.com/?q=3D+Cafe+Poris+Indah" target="_blank" class="btn-outline px-8 py-3.5 rounded-full text-sm font-medium inline-flex items-center gap-2"><span class="iconify" data-icon="ph:map-pin-bold"></span> Lokasi</a>
        </div>
        <!-- Floating icons -->
        <div class="absolute -left-10 top-1/3 hidden lg:block float-1 opacity-[0.12]"><span class="iconify text-7xl text-indigo-400" data-icon="ph:coffee-bold"></span></div>
        <div class="absolute -right-5 top-1/4 hidden lg:block float-2 opacity-[0.08]"><span class="iconify text-6xl text-fuchsia-400" data-icon="ph:cube-bold"></span></div>
        <div class="absolute right-16 bottom-1/4 hidden lg:block float-3 opacity-[0.08]"><span class="iconify text-5xl text-amber-400" data-icon="ph:fork-knife-bold"></span></div>
        <div class="absolute left-20 bottom-1/3 hidden lg:block opacity-[0.06]" style="animation:waveFloat 8s ease-in-out infinite"><span class="iconify text-5xl text-emerald-400" data-icon="ph:plant-bold"></span></div>
    </div>
    <div class="absolute bottom-10 left-1/2 -translate-x-1/2 flex flex-col items-center gap-2 opacity-40">
        <span class="text-[10px] uppercase tracking-widest text-zinc-500">Scroll</span>
        <div class="w-5 h-8 rounded-full border border-zinc-600 flex items-start justify-center p-1.5"><div class="w-1 h-2 bg-zinc-400 rounded-full" style="animation:fadeInUp 1.5s ease-in-out infinite"></div></div>
    </div>
</section>

<!-- ===== MARQUEE ===== -->
<div class="relative overflow-hidden py-5 border-y border-white/[0.04]" style="z-index:1">
    <div class="marquee-track">
        <span class="flex items-center gap-8 px-4 text-xs font-light text-zinc-600 whitespace-nowrap">
            <span class="flex items-center gap-2"><span class="iconify text-indigo-500/40" data-icon="ph:coffee-bold"></span> Es Kopi Susu — 23K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-fuchsia-500/40" data-icon="ph:star-bold"></span> Ice Tiramisu Latte — 23K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-emerald-500/40" data-icon="ph:leaf-bold"></span> Pandan Latte — 23K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-amber-500/40" data-icon="ph:fork-knife-bold"></span> Rice Bowl — 26K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-rose-500/40" data-icon="ph:heart-bold"></span> Spaghetti Carbonara — 29K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-cyan-500/40" data-icon="ph:drop-bold"></span> Triple Peach Americano — 24K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-violet-500/40" data-icon="ph:cookie-bold"></span> 3Donut — 18K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-orange-500/40" data-icon="ph:fire-bold"></span> Mie Goreng 3D — 28K</span>
            <span class="text-zinc-800">✦</span>
        </span>
        <span class="flex items-center gap-8 px-4 text-xs font-light text-zinc-600 whitespace-nowrap">
            <span class="flex items-center gap-2"><span class="iconify text-indigo-500/40" data-icon="ph:coffee-bold"></span> Es Kopi Susu — 23K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-fuchsia-500/40" data-icon="ph:star-bold"></span> Ice Tiramisu Latte — 23K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-emerald-500/40" data-icon="ph:leaf-bold"></span> Pandan Latte — 23K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-amber-500/40" data-icon="ph:fork-knife-bold"></span> Rice Bowl — 26K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-rose-500/40" data-icon="ph:heart-bold"></span> Spaghetti Carbonara — 29K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-cyan-500/40" data-icon="ph:drop-bold"></span> Triple Peach Americano — 24K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-violet-500/40" data-icon="ph:cookie-bold"></span> 3Donut — 18K</span>
            <span class="text-zinc-800">✦</span>
            <span class="flex items-center gap-2"><span class="iconify text-orange-500/40" data-icon="ph:fire-bold"></span> Mie Goreng 3D — 28K</span>
            <span class="text-zinc-800">✦</span>
        </span>
    </div>
</div>

<!-- ===== STATS COUNTER ===== -->
<section class="py-16 px-6 relative" style="z-index:1">
    <div class="max-w-5xl mx-auto">
        <div class="grid grid-cols-2 lg:grid-cols-4 gap-4">
            <div class="animate-on-scroll glass rounded-2xl p-6 text-center relative overflow-hidden group">
                <div class="absolute inset-0 deco-dots opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
                <div class="relative z-10">
                    <p class="text-3xl sm:text-4xl font-bold stat-number" style="background:linear-gradient(135deg,#a5b4fc,#818cf8);-webkit-background-clip:text;-webkit-text-fill-color:transparent">55+</p>
                    <p class="text-xs text-zinc-500 font-light mt-2">Pilihan Menu</p>
                </div>
            </div>
            <div class="animate-on-scroll d1 glass rounded-2xl p-6 text-center relative overflow-hidden group">
                <div class="absolute inset-0 deco-dots opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
                <div class="relative z-10">
                    <p class="text-3xl sm:text-4xl font-bold stat-number" style="background:linear-gradient(135deg,#c084fc,#d946ef);-webkit-background-clip:text;-webkit-text-fill-color:transparent">7K</p>
                    <p class="text-xs text-zinc-500 font-light mt-2">Harga Mulai</p>
                </div>
            </div>
            <div class="animate-on-scroll d2 glass rounded-2xl p-6 text-center relative overflow-hidden group">
                <div class="absolute inset-0 deco-dots opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
                <div class="relative z-10">
                    <p class="text-3xl sm:text-4xl font-bold stat-number" style="background:linear-gradient(135deg,#34d399,#10b981);-webkit-background-clip:text;-webkit-text-fill-color:transparent">12.5</p>
                    <p class="text-xs text-zinc-500 font-light mt-2">Jam Buka / Hari</p>
                </div>
            </div>
            <div class="animate-on-scroll d3 glass rounded-2xl p-6 text-center relative overflow-hidden group">
                <div class="absolute inset-0 deco-dots opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
                <div class="relative z-10">
                    <p class="text-3xl sm:text-4xl font-bold stat-number" style="background:linear-gradient(135deg,#fbbf24,#f59e0b);-webkit-background-clip:text;-webkit-text-fill-color:transparent">4.8</p>
                    <p class="text-xs text-zinc-500 font-light mt-2 flex items-center justify-center gap-1"><span class="iconify text-amber-400" data-icon="ph:star-fill"></span> Rating Google</p>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="divider max-w-4xl mx-auto"></div>

<!-- ==================== ABOUT ==================== -->
<section id="about" class="py-24 sm:py-32 px-6 relative" style="z-index:1">
    <!-- Decorative -->
    <div class="absolute top-0 right-0 w-[300px] h-[300px] deco-blob pointer-events-none" style="background:linear-gradient(135deg,#6366f1,transparent);opacity:0.02"></div>
    <div class="corner-accent corner-tl" style="top:40px;left:40px"></div>
    <div class="corner-accent corner-br" style="bottom:40px;right:40px"></div>

    <div class="max-w-7xl mx-auto">
        <div class="section-deco animate-on-scroll">
            <div class="line"></div><div class="diamond"></div><div class="line"></div>
        </div>
        <div class="grid lg:grid-cols-2 gap-16 items-center">
            <div class="animate-on-scroll relative">
                <div class="relative rounded-2xl overflow-hidden aspect-[3/4]" style="animation:pulse-glow 4s ease-in-out infinite">
                    <img id="img-about_main" src="" alt="3D Cafe Interior" class="w-full h-full object-cover">
                    <div class="absolute inset-0" style="background:linear-gradient(to top,#09090b 0%,transparent 50%)"></div>
                </div>
                <!-- Floating badge -->
                <div class="absolute -bottom-6 -right-6 sm:right-auto sm:-left-6 glass-strong rounded-2xl p-5 float-2">
                    <div class="flex items-center gap-3">
                        <div class="w-12 h-12 rounded-xl flex items-center justify-center" style="background:linear-gradient(135deg,rgba(99,102,241,0.2),rgba(217,70,239,0.2))">
                            <span class="iconify text-2xl text-indigo-400" data-icon="ph:map-pin-bold"></span>
                        </div>
                        <div><p class="text-lg font-semibold">Poris Indah</p><p class="text-xs text-zinc-400 font-light">Cipondoh, Tangerang</p></div>
                    </div>
                </div>
                <!-- Small floating decoration -->
                <div class="absolute top-6 right-6 glass rounded-xl px-3 py-2 float-3 flex items-center gap-2">
                    <span class="w-2 h-2 rounded-full bg-emerald-500" style="box-shadow:0 0 8px rgba(16,185,129,0.5)"></span>
                    <span class="text-[10px] text-zinc-400 font-medium">OPEN NOW</span>
                </div>
            </div>
            <div>
                <div class="animate-on-scroll">
                    <span class="text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">Tentang Kami</span>
                    <h2 class="text-3xl sm:text-4xl font-semibold tracking-tight mb-6">
                        <span class="editable-text" data-key="about_title"></span><br>
                        <span class="text-zinc-400 editable-text" data-key="about_title_sub"></span>
                    </h2>
                </div>
                <div class="animate-on-scroll d1">
                    <p class="text-sm font-light text-zinc-400 leading-relaxed mb-6 editable-text" data-key="about_text_1"></p>
                    <p class="text-sm font-light text-zinc-400 leading-relaxed mb-10 editable-text" data-key="about_text_2"></p>
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div class="animate-on-scroll d2 glass rounded-xl p-4 group">
                        <span class="iconify text-xl text-indigo-400 mb-3 block group-hover:scale-110 transition-transform" data-icon="ph:coffee-bold"></span>
                        <p class="text-sm font-medium mb-1 editable-text" data-key="feature_1_title"></p>
                        <p class="text-xs text-zinc-500 font-light editable-text" data-key="feature_1_desc"></p>
                    </div>
                    <div class="animate-on-scroll d3 glass rounded-xl p-4 group">
                        <span class="iconify text-xl text-fuchsia-400 mb-3 block group-hover:scale-110 transition-transform" data-icon="ph:wallet-bold"></span>
                        <p class="text-sm font-medium mb-1 editable-text" data-key="feature_2_title"></p>
                        <p class="text-xs text-zinc-500 font-light editable-text" data-key="feature_2_desc"></p>
                    </div>
                    <div class="animate-on-scroll d4 glass rounded-xl p-4 group">
                        <span class="iconify text-xl text-emerald-400 mb-3 block group-hover:scale-110 transition-transform" data-icon="ph:clock-bold"></span>
                        <p class="text-sm font-medium mb-1 editable-text" data-key="feature_3_title"></p>
                        <p class="text-xs text-zinc-500 font-light editable-text" data-key="feature_3_desc"></p>
                    </div>
                    <div class="animate-on-scroll d5 glass rounded-xl p-4 group">
                        <span class="iconify text-xl text-amber-400 mb-3 block group-hover:scale-110 transition-transform" data-icon="ph:wi-fi-high-bold"></span>
                        <p class="text-sm font-medium mb-1 editable-text" data-key="feature_4_title"></p>
                        <p class="text-xs text-zinc-500 font-light editable-text" data-key="feature_4_desc"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="divider max-w-4xl mx-auto"></div>

<!-- ==================== HIGHLIGHTS ==================== -->
<section id="highlights" class="py-24 sm:py-32 px-6 relative" style="z-index:1">
    <div class="absolute bottom-0 left-0 w-[250px] h-[250px] deco-blob pointer-events-none" style="background:linear-gradient(135deg,#d946ef,transparent);opacity:0.02;animation-delay:3s"></div>
    <div class="max-w-7xl mx-auto">
        <div class="section-deco animate-on-scroll">
            <div class="line"></div><div class="diamond"></div><div class="line"></div>
        </div>
        <div class="text-center mb-16">
            <span class="animate-on-scroll text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">⭐ Best Sellers</span>
            <h2 class="animate-on-scroll d1 text-3xl sm:text-4xl font-semibold tracking-tight mb-4">Menu Favorit <span class="text-zinc-400">di 3D Cafe</span></h2>
            <p class="animate-on-scroll d2 text-sm font-light text-zinc-400 max-w-md mx-auto">Pilihan paling laris dari pelanggan kami — wajib coba saat berkunjung!</p>
        </div>
        <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <div class="animate-on-scroll menu-card glass rounded-2xl overflow-hidden">
                <div class="aspect-[16/10] overflow-hidden relative"><img id="img-highlight_1" src="" alt="" class="menu-img w-full h-full object-cover"><div class="absolute top-3 left-3 star-badge rounded-full px-2.5 py-1 flex items-center gap-1"><span class="iconify text-amber-400 text-xs" data-icon="ph:star-fill"></span><span class="text-[10px] font-medium text-amber-300">Signature</span></div></div>
                <div class="p-6"><div class="flex items-start justify-between mb-2"><h3 class="text-base font-medium editable-text" data-key="hl_1_name"></h3><span class="price-tag editable-text" data-key="hl_1_price"></span></div><p class="text-xs text-zinc-500 font-light leading-relaxed editable-text" data-key="hl_1_desc"></p></div>
            </div>
            <div class="animate-on-scroll d1 menu-card glass rounded-2xl overflow-hidden">
                <div class="aspect-[16/10] overflow-hidden relative"><img id="img-highlight_2" src="" alt="" class="menu-img w-full h-full object-cover"><div class="absolute top-3 left-3 star-badge rounded-full px-2.5 py-1 flex items-center gap-1"><span class="iconify text-amber-400 text-xs" data-icon="ph:star-fill"></span><span class="text-[10px] font-medium text-amber-300">Signature</span></div></div>
                <div class="p-6"><div class="flex items-start justify-between mb-2"><h3 class="text-base font-medium editable-text" data-key="hl_2_name"></h3><span class="price-tag editable-text" data-key="hl_2_price"></span></div><p class="text-xs text-zinc-500 font-light leading-relaxed editable-text" data-key="hl_2_desc"></p></div>
            </div>
            <div class="animate-on-scroll d2 menu-card glass rounded-2xl overflow-hidden">
                <div class="aspect-[16/10] overflow-hidden relative"><img id="img-highlight_3" src="" alt="" class="menu-img w-full h-full object-cover"><div class="absolute top-3 left-3 star-badge rounded-full px-2.5 py-1 flex items-center gap-1"><span class="iconify text-amber-400 text-xs" data-icon="ph:star-fill"></span><span class="text-[10px] font-medium text-amber-300">Signature</span></div></div>
                <div class="p-6"><div class="flex items-start justify-between mb-2"><h3 class="text-base font-medium editable-text" data-key="hl_3_name"></h3><span class="price-tag editable-text" data-key="hl_3_price"></span></div><p class="text-xs text-zinc-500 font-light leading-relaxed editable-text" data-key="hl_3_desc"></p></div>
            </div>
            <div class="animate-on-scroll d2 menu-card glass rounded-2xl overflow-hidden">
                <div class="aspect-[16/10] overflow-hidden"><img id="img-highlight_4" src="" alt="" class="menu-img w-full h-full object-cover"></div>
                <div class="p-6"><div class="flex items-start justify-between mb-2"><h3 class="text-base font-medium editable-text" data-key="hl_4_name"></h3><span class="price-tag editable-text" data-key="hl_4_price"></span></div><p class="text-xs text-zinc-500 font-light leading-relaxed editable-text" data-key="hl_4_desc"></p></div>
            </div>
            <div class="animate-on-scroll d3 menu-card glass rounded-2xl overflow-hidden">
                <div class="aspect-[16/10] overflow-hidden"><img id="img-highlight_5" src="" alt="" class="menu-img w-full h-full object-cover"></div>
                <div class="p-6"><div class="flex items-start justify-between mb-2"><h3 class="text-base font-medium editable-text" data-key="hl_5_name"></h3><span class="price-tag editable-text" data-key="hl_5_price"></span></div><p class="text-xs text-zinc-500 font-light leading-relaxed editable-text" data-key="hl_5_desc"></p></div>
            </div>
            <div class="animate-on-scroll d4 menu-card glass rounded-2xl overflow-hidden">
                <div class="aspect-[16/10] overflow-hidden"><img id="img-highlight_6" src="" alt="" class="menu-img w-full h-full object-cover"></div>
                <div class="p-6"><div class="flex items-start justify-between mb-2"><h3 class="text-base font-medium editable-text" data-key="hl_6_name"></h3><span class="price-tag editable-text" data-key="hl_6_price"></span></div><p class="text-xs text-zinc-500 font-light leading-relaxed editable-text" data-key="hl_6_desc"></p></div>
            </div>
        </div>
    </div>
</section>

<div class="divider max-w-4xl mx-auto"></div>

<!-- ==================== FULL MENU ==================== -->
<section id="menu" class="py-24 sm:py-32 px-6 relative" style="z-index:1">
    <div class="max-w-5xl mx-auto">
        <div class="section-deco animate-on-scroll"><div class="line"></div><div class="diamond"></div><div class="line"></div></div>
        <div class="text-center mb-12">
            <span class="animate-on-scroll text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">Menu Lengkap</span>
            <h2 class="animate-on-scroll d1 text-3xl sm:text-4xl font-semibold tracking-tight mb-4">Semua Menu <span class="text-zinc-400">3D Cafe</span></h2>
            <p class="animate-on-scroll d2 text-sm font-light text-zinc-400 max-w-md mx-auto">Harga terjangkau, rasa juara. Temukan favoritmu dari 55+ pilihan menu.</p>
        </div>
        <div class="animate-on-scroll d2 flex flex-wrap justify-center gap-3 mb-12">
            <button class="cat-btn active px-5 py-2 rounded-full text-xs font-medium border border-transparent" onclick="filterFullMenu('all',this)">Semua</button>
            <button class="cat-btn px-5 py-2 rounded-full text-xs font-medium text-zinc-400 border border-transparent hover:text-white" onclick="filterFullMenu('coffee',this)">☕ Kopi</button>
            <button class="cat-btn px-5 py-2 rounded-full text-xs font-medium text-zinc-400 border border-transparent hover:text-white" onclick="filterFullMenu('signature',this)">⭐ Signature</button>
            <button class="cat-btn px-5 py-2 rounded-full text-xs font-medium text-zinc-400 border border-transparent hover:text-white" onclick="filterFullMenu('other-drink',this)">🧋 Minuman Lain</button>
            <button class="cat-btn px-5 py-2 rounded-full text-xs font-medium text-zinc-400 border border-transparent hover:text-white" onclick="filterFullMenu('food',this)">🍟 Makanan</button>
        </div>
        <div id="fullMenuContainer">
            <div class="menu-category animate-on-scroll" data-cat="coffee"><h3 class="category-header text-lg font-medium mb-4">Essential Coffee</h3><div class="glass rounded-2xl overflow-hidden mb-8">
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Espresso</p><p class="text-xs text-zinc-500 font-light">Shot kopi murni, bold</p></div><span class="price-tag">10K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Americano</p><p class="text-xs text-zinc-500 font-light">Kopi hitam klasik, strong & clean</p></div><span class="price-tag">21K / 22K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Cappuccino</p><p class="text-xs text-zinc-500 font-light">Espresso + foam creamy</p></div><span class="price-tag">21K / 22K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Cafe Latte</p><p class="text-xs text-zinc-500 font-light">Smooth & milky</p></div><span class="price-tag">21K / 22K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Flavoured Latte</p><p class="text-xs text-zinc-500 font-light">Caramel / Hazelnut / Vanilla</p></div><span class="price-tag">22K / 23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Mocha Latte</p><p class="text-xs text-zinc-500 font-light">Perpaduan kopi + coklat</p></div><span class="price-tag">22K / 23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Irish Latte</p><p class="text-xs text-zinc-500 font-light">Latte dengan sentuhan creamy khas</p></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Triple Peach Americano</p><p class="text-xs text-zinc-500 font-light">Kopi unik dengan rasa peach fruity</p></div><span class="price-tag">24K</span></div>
            </div></div>
            <div class="menu-category animate-on-scroll d1" data-cat="signature"><h3 class="category-header text-lg font-medium mb-4">⭐ Signature Drink</h3><div class="glass rounded-2xl overflow-hidden mb-8">
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div class="flex items-center gap-2"><p class="text-sm font-medium">Es Kopi Susu</p><span class="text-[9px] px-1.5 py-0.5 rounded bg-amber-500/10 text-amber-400 font-medium">HIT</span></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Pandan Latte</p><p class="text-xs text-zinc-500 font-light">Aroma pandan khas Indonesia</p></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Ice Tiramisu Latte</p><p class="text-xs text-zinc-500 font-light">Rasa tiramisu yang unik</p></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Butterscotch Caramel</p><p class="text-xs text-zinc-500 font-light">Manis creamy butterscotch</p></div><span class="price-tag">24K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Yakult Series</p><p class="text-xs text-zinc-500 font-light">Segar probiotik</p></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Lychee Punch</p><p class="text-xs text-zinc-500 font-light">Segar buah lychee</p></div><span class="price-tag">23K</span></div>
            </div></div>
            <div class="menu-category animate-on-scroll d1" data-cat="other-drink"><h3 class="category-header text-lg font-medium mb-4">🍵 Tea Based</h3><div class="glass rounded-2xl overflow-hidden mb-8">
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Lychee Tea</p></div><span class="price-tag">20K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Strawberry Tea</p></div><span class="price-tag">20K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Lemon Tea</p></div><span class="price-tag">20K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Peach Tea</p></div><span class="price-tag">20K</span></div>
            </div></div>
            <div class="menu-category animate-on-scroll d2" data-cat="other-drink"><h3 class="category-header text-lg font-medium mb-4">🧋 Other Beverage</h3><div class="glass rounded-2xl overflow-hidden mb-8">
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Chocolate</p></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Choco Hazelnut</p></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Ice Taro Latte</p></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Matcha Latte</p></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Strawberry Mojito</p></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Matcha Blend</p></div><span class="price-tag">24K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Choco Beng Beng Blend</p></div><span class="price-tag">24K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Cookies n Cream</p></div><span class="price-tag">24K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Love Potion</p></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Pop Lemonade</p></div><span class="price-tag">23K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Mineral Water</p></div><span class="price-tag">7K</span></div>
            </div></div>
            <div class="menu-category animate-on-scroll d2" data-cat="other-drink"><h3 class="category-header text-lg font-medium mb-4">🍵 Artisan Tea</h3><div class="glass rounded-2xl overflow-hidden mb-8">
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Jasmine Tea</p></div><span class="price-tag">19K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Earl Grey Tea</p></div><span class="price-tag">19K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Pure Peppermint</p></div><span class="price-tag">19K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Chamomile</p></div><span class="price-tag">19K</span></div>
            </div></div>
            <div class="menu-category animate-on-scroll d3" data-cat="food"><h3 class="category-header text-lg font-medium mb-4">🍟 Snack</h3><div class="glass rounded-2xl overflow-hidden mb-8">
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">3D Platters</p><p class="text-xs text-zinc-500 font-light">Paket snack komplet</p></div><span class="price-tag">26K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">French Fries</p></div><span class="price-tag">16K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Chicken Skin</p></div><span class="price-tag">19K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Chicken Pop</p></div><span class="price-tag">21K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Roti Lipat</p></div><span class="price-tag">21K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Roti Bakar</p></div><span class="price-tag">19K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Cireng Bumbu Rujak</p></div><span class="price-tag">16K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Piscok 3D</p></div><span class="price-tag">18K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Singkong Goreng</p></div><span class="price-tag">15K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">3Donut</p></div><span class="price-tag">18K</span></div>
            </div></div>
            <div class="menu-category animate-on-scroll d4" data-cat="food"><h3 class="category-header text-lg font-medium mb-4">🍝 Main Course</h3><div class="glass rounded-2xl overflow-hidden mb-8">
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Rice Bowl</p><p class="text-xs text-zinc-500 font-light">Ayam + telur + saus creamy + jamur</p></div><span class="price-tag">26K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Spaghetti Aglio Olio</p></div><span class="price-tag">29K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Spaghetti Bolognese</p></div><span class="price-tag">29K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Spaghetti Carbonara</p></div><span class="price-tag">29K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Mie Goreng 3D</p></div><span class="price-tag">28K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Nasi Goreng Spesial</p></div><span class="price-tag">28K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Bento 3D Roll</p></div><span class="price-tag">25K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Kwetiau Goreng Spesial</p></div><span class="price-tag">28K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Nasi Grill Chicken</p></div><span class="price-tag">30K</span></div>
                <div class="menu-list-item flex items-center justify-between px-5 py-3.5"><div><p class="text-sm font-medium">Kwetiau Kuah</p></div><span class="price-tag">28K</span></div>
            </div></div>
        </div>
    </div>
</section>

<div class="divider max-w-4xl mx-auto"></div>

<!-- ==================== GALLERY ==================== -->
<section id="gallery" class="py-24 sm:py-32 px-6 relative" style="z-index:1">
    <div class="max-w-7xl mx-auto">
        <div class="section-deco animate-on-scroll"><div class="line"></div><div class="diamond"></div><div class="line"></div></div>
        <div class="text-center mb-16">
            <span class="animate-on-scroll text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">Suasana Kami</span>
            <h2 class="animate-on-scroll d1 text-3xl sm:text-4xl font-semibold tracking-tight mb-4">Intip <span class="text-zinc-400">3D Cafe</span></h2>
        </div>
        <div class="grid grid-cols-2 lg:grid-cols-4 gap-4">
            <div class="animate-on-scroll col-span-2 row-span-2 gallery-item relative rounded-2xl overflow-hidden cursor-pointer" style="min-height:400px">
                <img id="img-gallery_1" src="" alt="" class="w-full h-full object-cover absolute inset-0">
                <div class="gallery-overlay absolute inset-0 bg-black/50 flex items-end p-6 opacity-0"><div><p class="text-sm font-medium">Interior 3D Cafe</p><p class="text-xs text-zinc-400 font-light">Suasana cozy & modern</p></div></div>
            </div>
            <div class="animate-on-scroll d1 gallery-item relative rounded-2xl overflow-hidden aspect-square cursor-pointer">
                <img id="img-gallery_2" src="" alt="" class="w-full h-full object-cover absolute inset-0">
                <div class="gallery-overlay absolute inset-0 bg-black/50 flex items-end p-4 opacity-0"><p class="text-xs font-medium">Sudut Nongkrong</p></div>
            </div>
            <div class="animate-on-scroll d2 gallery-item relative rounded-2xl overflow-hidden aspect-square cursor-pointer">
                <img id="img-gallery_3" src="" alt="" class="w-full h-full object-cover absolute inset-0">
                <div class="gallery-overlay absolute inset-0 bg-black/50 flex items-end p-4 opacity-0"><p class="text-xs font-medium">Detail Interior</p></div>
            </div>
            <div class="animate-on-scroll d3 gallery-item relative rounded-2xl overflow-hidden aspect-square cursor-pointer">
                <img id="img-gallery_4" src="" alt="" class="w-full h-full object-cover absolute inset-0">
                <div class="gallery-overlay absolute inset-0 bg-black/50 flex items-end p-4 opacity-0"><p class="text-xs font-medium">Display Minuman</p></div>
            </div>
            <div class="animate-on-scroll d4 gallery-item relative rounded-2xl overflow-hidden aspect-square cursor-pointer">
                <img id="img-gallery_5" src="" alt="" class="w-full h-full object-cover absolute inset-0">
                <div class="gallery-overlay absolute inset-0 bg-black/50 flex items-end p-4 opacity-0"><p class="text-xs font-medium">Menu Makanan</p></div>
            </div>
        </div>
    </div>
</section>

<div class="divider max-w-4xl mx-auto"></div>

<!-- ==================== TESTIMONIALS ==================== -->
<section id="testimonials" class="py-24 sm:py-32 px-6 relative" style="z-index:1">
    <div class="absolute top-20 right-[5%] w-[200px] h-[200px] deco-blob pointer-events-none" style="background:linear-gradient(135deg,#f59e0b,transparent);opacity:0.02;animation-delay:2s"></div>
    <div class="max-w-5xl mx-auto">
        <div class="section-deco animate-on-scroll"><div class="line"></div><div class="diamond"></div><div class="line"></div></div>
        <div class="text-center mb-16">
            <span class="animate-on-scroll text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">Ulasan Tamu</span>
            <h2 class="animate-on-scroll d1 text-3xl sm:text-4xl font-semibold tracking-tight mb-4">Apa Kata <span class="text-zinc-400">Mereka?</span></h2>
        </div>
        <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <div class="animate-on-scroll testimonial-card glass rounded-2xl p-6">
                <div class="flex gap-1 mb-4"><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span></div>
                <p class="text-sm font-light text-zinc-300 leading-relaxed mb-6">"Es Kopi Susu-nya juara banget! Harga 23K tapi rasa sekelas cafe 50K-an. Tempatnya juga cozy, cocok buat kerja atau nongkrong."</p>
                <div class="flex items-center gap-3"><div class="w-9 h-9 rounded-full flex items-center justify-center text-xs font-medium" style="background:linear-gradient(135deg,#6366f1,#d946ef)">RA</div><div><p class="text-sm font-medium">Rizky Aditya</p><p class="text-xs text-zinc-500 font-light">Mahasiswa</p></div></div>
            </div>
            <div class="animate-on-scroll d1 testimonial-card glass rounded-2xl p-6">
                <div class="flex gap-1 mb-4"><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span></div>
                <p class="text-sm font-light text-zinc-300 leading-relaxed mb-6">"Ice Tiramisu Latte wajib coba! Unik banget rasanya. Spaghetti Carbonara-nya juga enak, porsinya banyak. Bakal balik lagi."</p>
                <div class="flex items-center gap-3"><div class="w-9 h-9 rounded-full flex items-center justify-center text-xs font-medium" style="background:linear-gradient(135deg,#10b981,#06b6d4)">SF</div><div><p class="text-sm font-medium">Sarah Fitri</p><p class="text-xs text-zinc-500 font-light">Karyawan Swasta</p></div></div>
            </div>
            <div class="animate-on-scroll d2 testimonial-card glass rounded-2xl p-6">
                <div class="flex gap-1 mb-4"><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-amber-400 text-sm" data-icon="ph:star-fill"></span><span class="iconify text-zinc-600 text-sm" data-icon="ph:star-fill"></span></div>
                <p class="text-sm font-light text-zinc-300 leading-relaxed mb-6">"Menu lengkap dari kopi sampai makanan berat, harganya ramah anak muda. WiFi kencang, tempat nyaman. Cuma kadang weekend rame."</p>
                <div class="flex items-center gap-3"><div class="w-9 h-9 rounded-full flex items-center justify-center text-xs font-medium" style="background:linear-gradient(135deg,#f59e0b,#ef4444)">DW</div><div><p class="text-sm font-medium">Dimas Wibowo</p><p class="text-xs text-zinc-500 font-light">Content Creator</p></div></div>
            </div>
        </div>
        <div class="animate-on-scroll d3 mt-8 text-center">
            <a href="https://maps.google.com/?q=3D+Cafe+Poris+Indah" target="_blank" class="inline-flex items-center gap-2 glass rounded-full px-5 py-2.5 hover:bg-white/[0.05] transition-all duration-300">
                <span class="iconify text-lg text-amber-400" data-icon="ph:star-fill"></span>
                <span class="text-sm font-medium">Lihat semua review di Google Maps</span>
                <span class="iconify text-sm text-zinc-400" data-icon="ph:arrow-up-right-bold"></span>
            </a>
        </div>
    </div>
</section>

<div class="divider max-w-4xl mx-auto"></div>

<!-- ==================== CONTACT ==================== -->
<section id="contact" class="py-24 sm:py-32 px-6 relative" style="z-index:1">
    <div class="corner-accent corner-tl" style="top:80px;left:40px"></div>
    <div class="max-w-7xl mx-auto">
        <div class="section-deco animate-on-scroll"><div class="line"></div><div class="diamond"></div><div class="line"></div></div>
        <div class="grid lg:grid-cols-2 gap-16">
            <div>
                <span class="animate-on-scroll text-[10px] font-medium uppercase tracking-wider text-indigo-400 mb-4 block">Kunjungi Kami</span>
                <h2 class="animate-on-scroll d1 text-3xl sm:text-4xl font-semibold tracking-tight mb-6">Kami Menunggu<br><span class="text-zinc-400">Kedatanganmu</span></h2>
                <p class="animate-on-scroll d2 text-sm font-light text-zinc-400 leading-relaxed mb-10">Datang sendiri, berdua, atau bareng teman-teman — 3D Cafe selalu siap menyambut dengan menu terbaik dan suasana yang nyaman.</p>
                <div class="space-y-4">
                    <div class="animate-on-scroll d2 glass rounded-xl p-5 flex items-start gap-4">
                        <div class="w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0" style="background:rgba(99,102,241,0.1)"><span class="iconify text-lg text-indigo-400" data-icon="ph:map-pin-bold"></span></div>
                        <div><p class="text-sm font-medium mb-1">Lokasi</p><p class="text-xs text-zinc-400 font-light">Jl. Poris Indah Blk. E No.860B, RT.002/RW.004,<br>Cipondoh Indah, Kec. Cipondoh,<br>Kota Tangerang, Banten 15148</p></div>
                    </div>
                    <div class="animate-on-scroll d3 glass rounded-xl p-5 flex items-start gap-4">
                        <div class="w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0" style="background:rgba(217,70,239,0.1)"><span class="iconify text-lg text-fuchsia-400" data-icon="ph:clock-bold"></span></div>
                        <div><p class="text-sm font-medium mb-1">Jam Buka</p><p class="text-xs text-zinc-400 font-light">Setiap hari (Senin — Minggu)</p><p class="text-xs text-zinc-400 font-light">11:00 — 23:30</p></div>
                    </div>
                    <div class="animate-on-scroll d4 glass rounded-xl p-5 flex items-start gap-4">
                        <div class="w-10 h-10 rounded-lg flex items-center justify-center flex-shrink-0" style="background:rgba(16,185,129,0.1)"><span class="iconify text-lg text-emerald-400" data-icon="ph:phone-bold"></span></div>
                        <div><p class="text-sm font-medium mb-1">Kontak</p><p class="text-xs text-zinc-400 font-light">0812-7832-7756 (WhatsApp)</p><p class="text-xs text-zinc-400 font-light">@3dcafeporis (Instagram)</p></div>
                    </div>
                </div>
                <div class="animate-on-scroll d5 flex items-center gap-3 mt-8">
                    <a href="https://instagram.com/3dcafeporis" target="_blank" class="w-10 h-10 rounded-lg glass flex items-center justify-center text-zinc-400 hover:text-white transition-all duration-300"><span class="iconify text-lg" data-icon="mdi:instagram"></span></a>
                    <a href="https://wa.me/6281278327756" target="_blank" class="w-10 h-10 rounded-lg glass flex items-center justify-center text-zinc-400 hover:text-white transition-all duration-300"><span class="iconify text-lg" data-icon="mdi:whatsapp"></span></a>
                    <a href="https://maps.google.com/?q=3D+Cafe+Poris+Indah" target="_blank" class="w-10 h-10 rounded-lg glass flex items-center justify-center text-zinc-400 hover:text-white transition-all duration-300"><span class="iconify text-lg" data-icon="ph:google-logo-bold"></span></a>
                </div>
                <div class="animate-on-scroll d5 mt-8 rounded-2xl overflow-hidden aspect-[16/9] glass">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3966.2!2d106.63!3d-6.17!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2s3D+Cafe+Poris+Indah!5e0!3m2!1sid!2sid!4v1" width="100%" height="100%" style="border:0;filter:invert(0.9) hue-rotate(180deg) brightness(0.8) contrast(1.2)" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>
            <div class="animate-on-scroll d2">
                <div class="glass-strong rounded-2xl p-8">
                    <h3 class="text-lg font-medium mb-1">Reservasi Meja</h3>
                    <p class="text-xs text-zinc-500 font-light mb-8">Isi formulir untuk reservasi meja di 3D Cafe.</p>
                    <form id="reservationForm" onsubmit="handleReservation(event)" class="space-y-5">
                        <div><label class="text-xs text-zinc-400 font-medium mb-2 block">Nama Lengkap</label><input type="text" required placeholder="Masukkan namamu" class="w-full bg-white/[0.03] border border-white/[0.08] rounded-xl px-4 py-3 text-sm font-light text-white placeholder:text-zinc-600 focus:outline-none focus:border-indigo-500/50 transition-colors"></div>
                        <div class="grid grid-cols-2 gap-4">
                            <div><label class="text-xs text-zinc-400 font-medium mb-2 block">Tanggal</label><input type="date" required class="w-full bg-white/[0.03] border border-white/[0.08] rounded-xl px-4 py-3 text-sm font-light text-white focus:outline-none focus:border-indigo-500/50 transition-colors" style="color-scheme:dark"></div>
                            <div><label class="text-xs text-zinc-400 font-medium mb-2 block">Waktu</label><select required class="w-full bg-white/[0.03] border border-white/[0.08] rounded-xl px-4 py-3 text-sm font-light text-white focus:outline-none focus:border-indigo-500/50 transition-colors" style="color-scheme:dark"><option value="" class="bg-zinc-900">Pilih waktu</option><option value="11:00" class="bg-zinc-900">11:00</option><option value="13:00" class="bg-zinc-900">13:00</option><option value="15:00" class="bg-zinc-900">15:00</option><option value="17:00" class="bg-zinc-900">17:00</option><option value="19:00" class="bg-zinc-900">19:00</option><option value="21:00" class="bg-zinc-900">21:00</option></select></div>
                        </div>
                        <div><label class="text-xs text-zinc-400 font-medium mb-2 block">Jumlah Orang</label><select required class="w-full bg-white/[0.03] border border-white/[0.08] rounded-xl px-4 py-3 text-sm font-light text-white focus:outline-none focus:border-indigo-500/50 transition-colors" style="color-scheme:dark"><option value="" class="bg-zinc-900">Pilih jumlah</option><option value="1" class="bg-zinc-900">1 orang</option><option value="2" class="bg-zinc-900">2 orang</option><option value="3" class="bg-zinc-900">3 orang</option><option value="4" class="bg-zinc-900">4 orang</option><option value="5" class="bg-zinc-900">5 orang</option><option value="6+" class="bg-zinc-900">6+ orang</option></select></div>
                        <div><label class="text-xs text-zinc-400 font-medium mb-2 block">Catatan (opsional)</label><textarea rows="3" placeholder="Permintaan khusus..." class="w-full bg-white/[0.03] border border-white/[0.08] rounded-xl px-4 py-3 text-sm font-light text-white placeholder:text-zinc-600 focus:outline-none focus:border-indigo-500/50 transition-colors resize-none"></textarea></div>
                        <button type="submit" class="btn-primary w-full py-3.5 rounded-xl text-sm font-medium flex items-center justify-center gap-2"><span class="iconify" data-icon="ph:calendar-check-bold"></span> Reservasi Sekarang</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="divider max-w-4xl mx-auto"></div>

<!-- CTA -->
<section class="py-24 px-6 relative" style="z-index:1">
    <div class="max-w-4xl mx-auto text-center animate-on-scroll">
        <div class="glass-strong rounded-3xl p-12 sm:p-16 relative overflow-hidden" style="animation:borderGlow 4s ease-in-out infinite">
            <div class="absolute top-0 right-0 w-64 h-64 rounded-full opacity-10" style="background:radial-gradient(circle,#6366f1,transparent);filter:blur(60px)"></div>
            <div class="absolute bottom-0 left-0 w-48 h-48 rounded-full opacity-10" style="background:radial-gradient(circle,#d946ef,transparent);filter:blur(60px)"></div>
            <div class="relative z-10">
                <div class="flex justify-center mb-6"><div class="w-16 h-16 rounded-2xl flex items-center justify-center" style="background:linear-gradient(135deg,rgba(99,102,241,0.15),rgba(217,70,239,0.15))"><span class="text-2xl font-bold" style="background:linear-gradient(135deg,#a5b4fc,#c084fc);-webkit-background-clip:text;-webkit-text-fill-color:transparent">3D</span></div></div>
                <h2 class="text-3xl sm:text-4xl font-semibold tracking-tight mb-4">Yuk ke <span style="background:linear-gradient(to right,#a5b4fc,#c084fc,#f0abfc);-webkit-background-clip:text;-webkit-text-fill-color:transparent">3D Cafe</span></h2>
                <p class="text-sm font-light text-zinc-400 max-w-md mx-auto mb-8">Follow Instagram untuk update menu terbaru, promo spesial, dan vibe cafe setiap hari.</p>
                <div class="flex flex-col sm:flex-row items-center justify-center gap-4">
                    <a href="https://instagram.com/3dcafeporis" target="_blank" class="btn-primary px-8 py-3.5 rounded-full text-sm font-medium inline-flex items-center gap-2"><span class="iconify" data-icon="mdi:instagram"></span> @3dcafeporis</a>
                    <a href="https://wa.me/6281278327756" target="_blank" class="btn-outline px-8 py-3.5 rounded-full text-sm font-medium inline-flex items-center gap-2"><span class="iconify" data-icon="mdi:whatsapp"></span> Chat WhatsApp</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="border-t border-white/[0.05] py-12 px-6 relative" style="z-index:1">
    <div class="max-w-7xl mx-auto">
        <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-10 mb-12">
            <div class="sm:col-span-2 lg:col-span-1">
                <div class="flex items-center gap-2.5 mb-4"><div class="w-8 h-8 rounded-lg flex items-center justify-center" style="background:linear-gradient(to top right,#6366f1,#d946ef)"><span class="text-white text-[11px] font-bold">3D</span></div><span class="logo-3d editable-text" data-key="cafe_name"></span></div>
                <p class="text-xs text-zinc-500 font-light leading-relaxed mb-4">Kopi, makanan & suasana cozy di Poris Indah, Tangerang. Harga ramah, rasa juara.</p>
                <div class="flex items-center gap-2"><span class="w-1.5 h-1.5 rounded-full bg-emerald-500" style="box-shadow:0 0 8px rgba(16,185,129,0.5)"></span><span class="text-xs text-zinc-500 font-light">Buka Sekarang</span></div>
            </div>
            <div><p class="text-xs font-medium uppercase tracking-wider text-zinc-400 mb-4">Navigasi</p><ul class="space-y-2.5"><li><a href="#about" class="text-xs text-zinc-500 font-light hover:text-white transition-colors">Tentang Kami</a></li><li><a href="#highlights" class="text-xs text-zinc-500 font-light hover:text-white transition-colors">Menu Favorit</a></li><li><a href="#menu" class="text-xs text-zinc-500 font-light hover:text-white transition-colors">Menu Lengkap</a></li><li><a href="#gallery" class="text-xs text-zinc-500 font-light hover:text-white transition-colors">Galeri</a></li></ul></div>
            <div><p class="text-xs font-medium uppercase tracking-wider text-zinc-400 mb-4">Jam Operasional</p><ul class="space-y-2.5"><li class="text-xs text-zinc-500 font-light">Senin — Minggu</li><li class="text-xs text-zinc-400 font-medium">11:00 — 23:30</li><li class="text-xs text-zinc-600 font-light mt-2">Buka setiap hari</li></ul></div>
            <div><p class="text-xs font-medium uppercase tracking-wider text-zinc-400 mb-4">Kontak</p><ul class="space-y-2.5"><li class="text-xs text-zinc-500 font-light">Jl. Poris Indah Blk. E No.860B</li><li class="text-xs text-zinc-500 font-light">Cipondoh Indah, Tangerang</li><li class="text-xs text-zinc-500 font-light">0812-7832-7756</li><li class="text-xs text-zinc-500 font-light">@3dcafeporis</li></ul></div>
        </div>
        <div class="divider mb-8"></div>
        <div class="flex flex-col sm:flex-row items-center justify-between gap-4">
            <p class="text-xs text-zinc-600 font-light">© 2025 3D Cafe Poris Indah. All rights reserved.</p>
            <p class="text-xs text-zinc-700 font-light">Crafted with <span class="text-fuchsia-500">♥</span> and good coffee</p>
        </div>
    </div>
</footer>

<!-- Toast -->
<div class="toast" id="toast"><div class="glass-strong rounded-xl px-6 py-4 flex items-center gap-3"><div class="w-8 h-8 rounded-lg flex items-center justify-center flex-shrink-0" style="background:rgba(16,185,129,0.15)"><span class="iconify text-emerald-400" data-icon="ph:check-bold"></span></div><div><p class="text-sm font-medium" id="toastTitle">Berhasil!</p><p class="text-xs text-zinc-400 font-light" id="toastMsg"></p></div></div></div>

<!-- WhatsApp Float -->
<a href="https://wa.me/6281278327756?text=Halo%203D%20Cafe,%20saya%20mau%20tanya%20tentang%20menu%20dan%20reservasi" target="_blank" class="fixed bottom-6 right-6 z-40 w-14 h-14 rounded-full flex items-center justify-center transition-all duration-300 hover:scale-110" style="background:#25d366;box-shadow:0 4px 20px rgba(37,211,102,0.4)">
    <span class="iconify text-white text-2xl" data-icon="mdi:whatsapp"></span>
</a>

<!-- Settings Toggle -->
<div class="settings-toggle">
    <button onclick="tryOpenSettings()" title="Admin Panel">
        <span class="iconify" data-icon="ph:gear-six-bold"></span>
    </button>
</div>

<!-- Password Modal -->
<div class="pw-modal" id="pwModal">
    <div class="modal-box glass-strong rounded-3xl p-8 w-[90vw] max-w-sm text-center">
        <div class="w-16 h-16 rounded-2xl mx-auto mb-6 flex items-center justify-center" style="background:linear-gradient(135deg,rgba(99,102,241,0.15),rgba(217,70,239,0.15))">
            <span class="iconify text-3xl text-indigo-400" data-icon="ph:lock-key-bold"></span>
        </div>
        <h3 class="text-lg font-semibold mb-2">Admin Access</h3>
        <p class="text-xs text-zinc-500 font-light mb-6">Masukkan password untuk mengakses panel pengaturan.</p>
        <form onsubmit="submitPassword(event)">
            <input type="password" id="pwInput" class="pw-input mb-4" placeholder="••••••••" required autocomplete="off">
            <p id="pwError" class="text-xs text-red-400 font-light mb-4 h-4"></p>
            <div class="flex gap-3">
                <button type="button" onclick="closePwModal()" class="flex-1 py-3 rounded-xl text-sm font-medium border border-white/[0.08] text-zinc-400 hover:text-white transition-all">Batal</button>
                <button type="submit" class="btn-primary flex-1 py-3 rounded-xl text-sm font-medium">Masuk</button>
            </div>
        </form>
    </div>
</div>

<!-- Settings Overlay -->
<div class="settings-overlay" id="settingsOverlay" onclick="closeSettings()"></div>

<!-- Settings Panel -->
<div class="settings-panel" id="settingsPanel">
    <div class="p-6">
        <div class="flex items-center justify-between mb-6">
            <div><h3 class="text-lg font-semibold flex items-center gap-2"><span class="iconify text-indigo-400" data-icon="ph:sliders-bold"></span> Admin Panel</h3><p class="text-xs text-zinc-500 font-light mt-1">Edit teks, harga & gambar</p></div>
            <div class="flex items-center gap-2">
                <button onclick="logoutAdmin()" class="w-9 h-9 rounded-lg glass flex items-center justify-center text-zinc-500 hover:text-red-400 transition-colors" title="Logout"><span class="iconify text-lg" data-icon="ph:sign-out-bold"></span></button>
                <button onclick="closeSettings()" class="w-9 h-9 rounded-lg glass flex items-center justify-center text-zinc-400 hover:text-white transition-colors"><span class="iconify text-lg" data-icon="ph:x-bold"></span></button>
            </div>
        </div>

        <!-- Tabs -->
        <div class="flex gap-2 mb-6 p-1 glass rounded-xl">
            <button class="tab-btn active flex-1" onclick="switchTab('text',this)">
                <span class="iconify text-sm mr-1" data-icon="ph:text-aa-bold"></span> Teks & Harga
            </button>
            <button class="tab-btn flex-1" onclick="switchTab('images',this)">
                <span class="iconify text-sm mr-1" data-icon="ph:images-bold"></span> Gambar
            </button>
        </div>

        <!-- Text Tab -->
        <div id="tab-text" class="tab-content active">
            <div class="space-y-4" id="textSlotsContainer"></div>
        </div>

        <!-- Images Tab -->
        <div id="tab-images" class="tab-content">
            <div class="glass rounded-xl p-4 mb-4">
                <p class="text-xs text-zinc-400 font-light leading-relaxed">
                    <span class="text-indigo-400 font-medium">💡 Tips:</span> Upload foto ke 
                    <a href="https://imgbb.com" target="_blank" class="text-indigo-400 underline underline-offset-2">imgbb.com</a> (gratis), copy "Direct link", paste di kolom.
                </p>
            </div>
            <div class="space-y-4" id="imageSlotsContainer"></div>
        </div>

        <!-- Actions -->
        <div class="flex items-center gap-3 mt-8 pt-6 border-t border-white/[0.06]">
            <button onclick="saveAll()" class="btn-primary flex-1 py-3 rounded-xl text-sm font-medium flex items-center justify-center gap-2">
                <span class="iconify" data-icon="ph:check-bold"></span> Simpan Semua
            </button>
            <button onclick="resetAll()" class="reset-btn flex-1 py-3 rounded-xl text-sm font-medium flex items-center justify-center gap-2 border border-white/[0.08] text-zinc-400">
                <span class="iconify" data-icon="ph:arrow-counter-clockwise-bold"></span> Reset
            </button>
        </div>
        <div class="mt-4 flex items-center gap-3">
            <button onclick="exportConfig()" class="flex-1 py-2.5 rounded-xl text-xs font-medium flex items-center justify-center gap-2 border border-white/[0.06] text-zinc-500 hover:text-zinc-300 hover:border-white/[0.12] transition-all">
                <span class="iconify" data-icon="ph:download-simple-bold"></span> Export JSON
            </button>
            <button onclick="document.getElementById('importFile').click()" class="flex-1 py-2.5 rounded-xl text-xs font-medium flex items-center justify-center gap-2 border border-white/[0.06] text-zinc-500 hover:text-zinc-300 hover:border-white/[0.12] transition-all">
                <span class="iconify" data-icon="ph:upload-simple-bold"></span> Import JSON
            </button>
            <input type="file" id="importFile" accept=".json" style="display:none" onchange="importConfig(event)">
        </div>
    </div>
</div>

<!-- ==================== SCRIPTS ==================== -->
<script>
// ── Apply all config to DOM ──
function applyConfigToDOM() {
    // Texts
    document.querySelectorAll('.editable-text').forEach(el => {
        const key = el.getAttribute('data-key');
        if (key) el.textContent = C(key);
    });
    // Images
    Object.keys(DEFAULT_CONFIG).forEach(key => {
        if (key.startsWith('highlight_') || key.startsWith('gallery_') || key === 'about_main') {
            const el = document.getElementById('img-' + key);
            if (el) el.src = C(key);
        }
    });
}
applyConfigToDOM();

// ── Password Modal ──
function tryOpenSettings() {
    if (isAdmin) { openSettings(); return; }
    document.getElementById('pwModal').classList.add('open');
    document.getElementById('pwInput').value = '';
    document.getElementById('pwError').textContent = '';
    setTimeout(() => document.getElementById('pwInput').focus(), 300);
}
function closePwModal() { document.getElementById('pwModal').classList.remove('open'); }
function submitPassword(e) {
    e.preventDefault();
    const pw = document.getElementById('pwInput').value;
    if (pw === ADMIN_PASS) {
        isAdmin = true;
        sessionStorage.setItem('3dcafe_auth', 'true');
        closePwModal();
        openSettings();
        showToast('Login Berhasil! 🔓', 'Selamat datang di Admin Panel.');
    } else {
        const inp = document.getElementById('pwInput');
        inp.classList.add('error');
        document.getElementById('pwError').textContent = 'Password salah. Coba lagi.';
        setTimeout(() => inp.classList.remove('error'), 600);
    }
}
function logoutAdmin() {
    isAdmin = false;
    sessionStorage.removeItem('3dcafe_auth');
    closeSettings();
    showToast('Logged Out 🔒', 'Sesi admin telah berakhir.');
}

// ── Settings Panel ──
function openSettings() {
    document.getElementById('settingsPanel').classList.add('open');
    document.getElementById('settingsOverlay').classList.add('open');
    buildTextSlots();
    buildImageSlots();
}
function closeSettings() {
    document.getElementById('settingsPanel').classList.remove('open');
    document.getElementById('settingsOverlay').classList.remove('open');
}

// ── Tabs ──
function switchTab(tab, btn) {
    document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
    btn.classList.add('active');
    document.getElementById('tab-' + tab).classList.add('active');
}

// ── Build Text Slots ──
function buildTextSlots() {
    const container = document.getElementById('textSlotsContainer');
    container.innerHTML = '';
    const textKeys = Object.keys(TEXT_LABELS);
    // Group: Info Cafe
    addTextGroup(container, '🏷️ Informasi Cafe', textKeys.filter(k => k.startsWith('cafe_') || k.startsWith('hero_')));
    addTextGroup(container, '📖 Tentang Kami', textKeys.filter(k => k.startsWith('about_')));
    addTextGroup(container, '✨ Fitur Unggulan', textKeys.filter(k => k.startsWith('feature_')));
    addTextGroup(container, '☕ Menu Highlight', textKeys.filter(k => k.startsWith('hl_')));
}
function addTextGroup(container, title, keys) {
    if (!keys.length) return;
    const group = document.createElement('div');
    group.innerHTML = `<p class="text-xs font-medium text-zinc-400 mb-3 mt-2">${title}</p>`;
    keys.forEach(key => {
        const slot = document.createElement('div');
        slot.className = 'mb-3';
        slot.innerHTML = `<label class="text-[10px] text-zinc-500 mb-1 block">${TEXT_LABELS[key]}</label><input class="text-edit-input" data-key="${key}" value="${savedConfig[key] || ''}" placeholder="${DEFAULT_CONFIG[key] || ''}" onfocus="this.select()">`;
        group.appendChild(slot);
    });
    container.appendChild(group);
}

// ── Build Image Slots ──
function buildImageSlots() {
    const container = document.getElementById('imageSlotsContainer');
    container.innerHTML = '';
    const imgKeys = Object.keys(IMAGE_LABELS);
    imgKeys.forEach(key => {
        const currentUrl = C(key);
        const shape = IMAGE_SHAPES[key] || 'wide';
        const previewClass = shape === 'square' ? 'img-preview-square' : shape === 'tall' ? 'img-preview-tall' : 'img-preview';
        const slot = document.createElement('div');
        slot.className = 'img-slot p-4';
        slot.innerHTML = `
            <div class="flex items-center justify-between mb-3">
                <span class="text-xs font-medium text-zinc-300">${IMAGE_LABELS[key]}</span>
                <span class="text-[10px] text-zinc-600 font-mono">${key}</span>
            </div>
            <img src="${currentUrl}" alt="" class="${previewClass} mb-3" id="preview-${key}" onerror="this.style.background='#18181b'">
            <input type="text" placeholder="Paste URL gambar baru..." value="${savedConfig[key] || ''}" data-imgkey="${key}" oninput="previewImg(this)" onfocus="this.select()">
        `;
        container.appendChild(slot);
    });
}
function previewImg(input) {
    const key = input.getAttribute('data-imgkey');
    const preview = document.getElementById('preview-' + key);
    if (preview && input.value.trim()) preview.src = input.value.trim();
    else if (preview) preview.src = DEFAULT_CONFIG[key] || '';
}

// ── Save All ──
function saveAll() {
    const newConfig = {};
    // Text
    document.querySelectorAll('.text-edit-input[data-key]').forEach(inp => {
        if (inp.value.trim()) newConfig[inp.key = inp.getAttribute('data-key')] = inp.value.trim();
    });
    // Images
    document.querySelectorAll('input[data-imgkey]').forEach(inp => {
        if (inp.value.trim()) newConfig[inp.getAttribute('data-imgkey')] = inp.value.trim();
    });
    if (Object.keys(newConfig).length === 0) {
        showToast('Tidak Ada Perubahan', 'Edit teks atau gambar terlebih dahulu.');
        return;
    }
    savedConfig = { ...savedConfig, ...newConfig };
    localStorage.setItem('3dcafe_config', JSON.stringify(savedConfig));
    applyConfigToDOM();
    showToast('Disimpan! ✨', `${Object.keys(newConfig).length} perubahan telah diterapkan.`);
}

// ── Reset All ──
function resetAll() {
    savedConfig = {};
    localStorage.removeItem('3dcafe_config');
    applyConfigToDOM();
    buildTextSlots();
    buildImageSlots();
    showToast('Direset! 🔄', 'Semua konten kembali ke default.');
}

// ── Export/Import ──
function exportConfig() {
    if (!Object.keys(savedConfig).length) { showToast('Kosong', 'Tidak ada data custom untuk di-export.'); return; }
    const blob = new Blob([JSON.stringify(savedConfig, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a'); a.href = url; a.download = '3dcafe-config.json'; a.click();
    URL.revokeObjectURL(url);
    showToast('Export Berhasil! 📁', 'File konfigurasi telah didownload.');
}
function importConfig(event) {
    const file = event.target.files[0]; if (!file) return;
    const reader = new FileReader();
    reader.onload = function(e) {
        try {
            const data = JSON.parse(e.target.result);
            savedConfig = { ...savedConfig, ...data };
            localStorage.setItem('3dcafe_config', JSON.stringify(savedConfig));
            applyConfigToDOM(); buildTextSlots(); buildImageSlots();
            showToast('Import Berhasil! 📥', 'Konfigurasi telah diterapkan.');
        } catch(err) { showToast('Gagal Import', 'File tidak valid.'); }
    };
    reader.readAsText(file);
    event.target.value = '';
}

// ── Toast ──
function showToast(title, msg) {
    const t = document.getElementById('toast');
    document.getElementById('toastTitle').textContent = title;
    document.getElementById('toastMsg').textContent = msg;
    t.classList.add('show');
    setTimeout(() => t.classList.remove('show'), 4000);
}

// ── Navbar scroll ──
const navbar = document.getElementById('navbar');
window.addEventListener('scroll', () => {
    if (window.pageYOffset > 50) { navbar.style.background='rgba(9,9,11,0.85)';navbar.style.backdropFilter='blur(20px)';navbar.style.borderBottom='1px solid rgba(255,255,255,0.05)'; }
    else { navbar.style.background='transparent';navbar.style.backdropFilter='none';navbar.style.borderBottom='none'; }
});

// ── Mobile menu ──
function toggleMobile() {
    document.getElementById('mobileMenu').classList.toggle('open');
    document.body.style.overflow = document.getElementById('mobileMenu').classList.contains('open') ? 'hidden' : '';
}

// ── Scroll animations ──
const obs = new IntersectionObserver((entries) => { entries.forEach(e => { if (e.isIntersecting) e.target.classList.add('visible'); }); }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });
document.querySelectorAll('.animate-on-scroll').forEach(el => obs.observe(el));

// ── Menu filter ──
function filterFullMenu(cat, btn) {
    document.querySelectorAll('.cat-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    document.querySelectorAll('.menu-category').forEach(catEl => {
        if (cat === 'all' || catEl.getAttribute('data-cat') === cat) {
            catEl.style.display = ''; catEl.style.opacity = '0'; catEl.style.transform = 'translateY(15px)';
            setTimeout(() => { catEl.style.transition = 'all 0.5s cubic-bezier(0.16,1,0.3,1)'; catEl.style.opacity = '1'; catEl.style.transform = 'translateY(0)'; }, 30);
        } else { catEl.style.display = 'none'; }
    });
}

// ── Reservation ──
function handleReservation(e) { e.preventDefault(); showToast('Reservasi Terkirim! 🎉', 'Kami akan konfirmasi via WhatsApp.'); e.target.reset(); }

// ── Min date ──
const di = document.querySelector('input[type="date"]');
if (di) di.setAttribute('min', new Date().toISOString().split('T')[0]);

// ── Keyboard shortcut ──
document.addEventListener('keydown', (e) => {
    if (e.ctrlKey && e.shiftKey && e.key === 'G') { e.preventDefault(); tryOpenSettings(); }
    if (e.key === 'Escape') { closePwModal(); closeSettings(); }
});
</script>
</body>
</html>
