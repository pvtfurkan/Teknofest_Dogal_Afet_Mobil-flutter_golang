import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';


const String api_link = "funny-grapes-share-212-252-142-187.loca.lt";


alt_mesaj(BuildContext context, String mesaj, {int tur: 0}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        mesaj,
        style: GoogleFonts.quicksand(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      margin: EdgeInsets.only(bottom: 30, right: 10, left: 10),
      behavior: SnackBarBehavior.floating,
      backgroundColor: tur == 0 ? Colors.red : Colors.green,
    ),
  );
}

bool oturum_kontrol() {
  GetStorage box = GetStorage();
  var sonuc =   box.read("kullanici");

  if(sonuc==null || sonuc.toString().length<20) {
    return false;
  }
  else {
    return true;
  }
}


class TextKutulari extends StatelessWidget {
  const TextKutulari({Key key, this.hinttext,this.kontrolcu,this.keyboard}) : super(key: key);
  final String hinttext;
  final  keyboard;
  final kontrolcu;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboard,
      controller: kontrolcu,
      decoration: InputDecoration(
        fillColor: Colors.pink.shade100,
        hintText: hinttext,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 20),
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black, width: 1)),
      ),
    );
  }
}

List<List<String>> sweetSayings = [
  ["Elimizden gelen her şekilde", "Size yardımcı olacağız ."],
  ["Sizin güçlü", "Kişiliğinize hayranız ."],
  ["Elimizden gelen her şekilde", "Size yardımcı olacağız ."],
  ["Sen güçlüsün", "ve cesursun ."]
];

List<String> articleTitle = [
  "Uygulamamızı Tanıyın",
  "Afet Yönetimi"
];
List<String> imageSliders = [
  "https://media.istockphoto.com/vectors/young-woman-looks-at-the-mirror-and-sees-her-happy-reflection-vector-id1278815846?k=20&m=1278815846&s=612x612&w=0&h=JUTmV9Of-_ILOfXBfV9Cmp_41yuTliSdFIcZy5LKuss=",
  "https://media.istockphoto.com/vectors/mental-health-or-psychology-concept-with-flowering-human-head-vector-id1268669581?k=20&m=1268669581&s=612x612&w=0&h=YVLTKCZXKugEn40aqOkir4vcoFeTUAQToa1i3AFYRNU=",
];

List<String> articles = [
  """Doğal Afet Mobil Uygulaması, kullanıcının yakını olan kişilerle bağlantıda kalmasını sağlayan bir mobil uygulamadır. Kullanıcıya SOS uyarıları aracılığıyla canlı konumunu kişilerle paylaşma seçeneği sunar ve kullanıcının acil servislere erişmesini sağlar. Kişisel arkadaşınızdır.
  ● SOS bildirimini göndermek istediğiniz kişileri rehberinizden seçebilirsiniz.
  ● Her 15 dakikada bir konumunuzu paylaşmak istediğinizde bu özelliği aktif hale getirebilirsiniz.
  ● Güvenli Sarsıntı özelliği ile telefonunuzu sallayarak/sarsarak SOS bildirimini uygulamayı açmadan gönderebilirsiniz.""",



"""● Depremden Korunma Yolları
      - Deprem herkesi korkutan ve endişelendiren bir konu. En etkin fay hatlarından biri olan Akdeniz-Alp-Himalaya kuşağında bulunduğumuzu göz önünde bulundurursak çok da haksız sayılmayız. Fakat bu konuda hiçbir adım atmayıp sürekli deprem korkusu ile yaşayarak vakit geçmez. Deprem her ne kadar bizim dışımızda meydana gelen bir doğal afet olsa da, önlemlerimizi alıp etkisini azaltmamız mümkün. Depreme karşı önlem olarak:   
   ● Öncesinde:
      - Dolap, kütüphane gibi devrilme riski olan eşyaları duvara sabitlenmeli. Arada boşluk kalıyorsa çarpma etkisini azaltmak için araları dolgu malzemesi ile doldurulmalı.
      - Tavan ya da duvara asılan avize, klima gibi cihazları ağırlıklarını taşıyacak şekilde duvar ve pencerelerden uzağa sağlam bir şekilde asılmalı. 
      - Tezgah ya da masa üzerinde bulunan eşyaları, plastik ya da metal tutucularla sabitlenmeli. 
      - Deprem çantası hazırlanmalı ve düzenli aralıklarla içindeki malzemeler kontrol edilmeli. 
      - Karyolaların üzerinde ya da yanında ağır ve devrilebilecek eşyalar bulundurmaktan kaçınılmalı. 
      - Ev sahibi iseniz Zorunlu Deprem Sigortası (DASK)​ yaptırmanız gerekir. Bu şekilde depremden kaynaklanan hasarları telafi edebilirsiniz.  
   ● Deprem esnasında:  
      - Deprem sırasında evde ya da kapalı bir alandaysanız sabitlenmemiş eşyalardan uzak durarak sağlam bir eşyanın yanına çömelip başınızı ve boynunuzu ellerinizle koruma altına alın.  
      - Kibrit ya da çakmak yakmamalı elektrikli düğmelerden uzak durmalısınız.  
      - Deprem sırasında açık alanda iseniz duvar tipleri, enerji hatları ve ağaçlardan uzak durun. Açık arazide çömelerek kendinizi koruma altına alın.  
      - Depreme aracın içinde yakalandığınızda ise kendinizi ve başka araçları riske atmadan sağa yanaşıp sarsıntının geçmesini bekleyebilirsiniz.   
      
      
      
  ● Selden Korunma Yolları  
      - Ülkemizde en çok can ve mal kaybına sebep olan doğal afetlerden biri de sel. Plansız şehirleşme, yeşil alanların hızla yok olması selden dolayı oluşabilecek riskleri artırıyor. Bu etkileri hafifletmek ve çeşitli önlemler almak elbette ki mümkün. Sele karşı alınacak önlemler ise:   
  ● Öncesinde:   
      - Çevredeki yeşil alanlar korunmalı ve artırılmalı.  
      - Sel tehlikesi bulunan alanlarda teraslama ve ağaçlandırma yapılmalı.  
      - Çeşitli iletişim kanallarıyla gerekli uyarılar yapılmalı.  
  ● Sel esnasında:   
      - Yüksek ve güvenli bir yere ulaşmaya çalışmalısınız. Fakat bunu yaparken suyun içinden geçmemeye dikkat edin. Çünkü görünenden çok daha derin olabilir.  
      - Sel sırasında araç içindeyseniz asla ileri doğru gitmeye çalışmayın. Aracın içini terk edip yüksek bir yere geçmek için çabalayın. 
      
      
      
  ● Çığ Tehlikesine Karşı Alınacak Önlemler
      - Eğimli araziler üzerinden yuvarlanan ve yuvarlandıkça büyüyen kar kütlesine çığ denir. Çığ kar yağışının ve engebenin fazla olduğu bitki örtüsünden yoksun yerlerde görülür. Çığ olayıyla karşılaşma ihtimalimizi az gördüğümüz için bu konudaki bilincimiz ise maalesef daha düşük. Oysaki çığ tehlikesine karşı:  
  ● Öncesinde:   
      - Yerleşim yeri olarak çığ riski taşıyan bölgelerden kaçınılmalı. 
      - Yamaçlardaki bitki örtüsü ve ormanlar koruma altına alınmalı.  
      - Kar yağışı olan zamanlarda haberler ve yol durumu dikkatle takip edilmeli.   
   ● Çığ esnasında:  
      - Çığın büyüklüğü ve hızı dikkate alınarak güvenli bir bölgeye ulaşın.  
      - Çığdan kaçmanız imkansız ise yerden destek alarak yüzme hareketleriyle yüzeyde kalmaya çalışın.  
      - Başınızın karın altında kalma tehlikesine karşı ağzınızı sıkıca kapatın ve nefesinizi tutmaya çalışın. 
      - Kar akışına kapılırsanız bacaklarınızı ve kollarınızı vücudunuza birleştirerek oturma pozisyonu almaya gayret edin.  
      - Araç içindeyseniz motoru durdurup ışıkları söndürün.  
      - Yanınızda fener varsa sizi görmeleri açısından kullanmanız faydalı olabilir.  
      
      
      
  ● Heyelan Tehlikesine Karşı Alınacak Önlemler
      - Heyelan büyük ölçüdeki toprak ve kaya kaymalarına verilen isimdir. Ülkemiz aynı deprem ve sel gibi heyelan tehlikesini de barındırır. Özellikle yağışın ve eğimin fazla olduğu bölgelerde çok fazla görülen heyelanın bir doğal afete dönüşmemesi için önceden çeşitli önlemler alıp hem kendimizi hem de sevdiklerimizi koruyabiliriz.   
  ● Öncesinde:   
      - Heyelan riskini azaltmak için arazi çalışmaları yapılmalı, risk olan bölgelerde yerleşimden uzak durulmalı.  
      - Risk olan yamaçlarda doğal denge bozulmadan drenaj kanalları açılmalı, tabakların fazla su alınması önlenmeli.  
      - Heyelan görülebilecek yamaçların eteklerine istinat duvarı inşa edilmeli.  
      - Bitki ve toprak örtüsü korunmalı.   
  ● Heyelan esnasında:   
      - Açık alandaysanız çamur ve heyelan akıntısından uzak durup yüksek yerlere kaçmaya çalışın.  
      - Heyelan akıntısından kaçabilecek zamanınız yoksa ve kapalı alandaysanız sağlam eşyaların arkasına sığınarak çömelin, ellerinizle başınızı ve boynunuzu koruyun.    
      
      
      
 Gördüğünüz gibi doğal afetler meydana gelmeden önce önlemler almak ve olduğu sırada bilinçli bir şekilde hareket etmek hayatımızı kurtarıyor. Bu konuda kendimizi eğitmek ise hepimizin üstüne düşen bir görev. Bu sebeple doğal afetlerle mücadele etmek için daha fazla bilgiye sahip olmak istiyorsanız AFAD tarafından verilen Temel Afet Bilinci Eğitimleri’ne katılabilir, sevdiklerinizi de bu eğitimler için teşvik edebilirsiniz.
"""




];