# Flutter GetX Boilerplate

Bu proje, Flutter uygulamaları için hazırlanmış modern ve ölçeklenebilir bir başlangıç şablonudur. GetX state management kullanılarak geliştirilmiş olup, temiz mimari prensiplerini takip etmektedir.

## 🚀 Özellikler

- GetX state management
- Reaktif form yönetimi
- Çoklu dil desteği (i18n)
- Tema yönetimi
- API entegrasyonu için Dio
- Local storage yönetimi
- SVG desteği
- Önbelleğe alınmış görüntü yönetimi
- Yükleme göstergeleri ve toast bildirimleri
- Responsive tasarım desteği

## 📋 Gereksinimler

- Flutter SDK: ^3.5.3
- Dart SDK: ^3.5.3
- Git

## 🛠️ Kurulum

1. Projeyi klonlayın:
```bash
git clone https://github.com/AhmetDemirEvrensel/flutter_getx_boilerplate.git
cd flutter_getx_boilerplate
```

2. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

3. Uygulamayı çalıştırın:
```bash
flutter run
```

## 📦 Kullanılan Paketler

- get: ^4.6.6
- flutter_dotenv: ^5.0.2
- shared_preferences: ^2.3.2
- dio: ^5.7.0
- reactive_forms: ^17.0.1
- flutter_i18n: ^0.36.2
- cached_network_image: ^3.4.1
- flutter_svg: ^2.0.10+1
- ve daha fazlası...

## 🏗️ Proje Yapısı

```
lib/
├── app/                    # Uygulama katmanı
│   ├── bindings/          # Bağımlılık enjeksiyonları
│   ├── controllers/       # GetX controllers
│   ├── data/             # Data katmanı
│   ├── modules/          # Uygulama modülleri
│   ├── routes/           # Rota tanımlamaları
│   └── widgets/          # Genel widget'lar
├── core/                  # Çekirdek fonksiyonlar
├── utils/                 # Yardımcı fonksiyonlar
└── main.dart             # Uygulama giriş noktası
```

## 🤝 Katkıda Bulunma

1. Fork'layın
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'feat: Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📝 Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## 📫 İletişim

Proje Sahibi - [@AhmetDemirEvrensel](https://github.com/AhmetDemirEvrensel)

Proje Linki: [https://github.com/AhmetDemirEvrensel/flutter_getx_boilerplate](https://github.com/AhmetDemirEvrensel/flutter_getx_boilerplate)
