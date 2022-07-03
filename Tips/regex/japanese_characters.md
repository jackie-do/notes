## 1) NUMERICALS
#### All numbers ( full-width )
```
/^[０-９]+$/
```

#### All numbers ( half-width )
```
/^[0-9]+$/
```

#### All numbers ( full-width , half-width )
```
/^[0-9０-９]+$/
```

#### All full-width numbers ( with full-width minus & point )
```
/^[ー]?[０-９]+(．[０-９]+)?$/
```

#### All half-width numbers ( with half-width minus & point )
```
/^[-]?[0-9]+(.[0-9]+)?$/
```

## 2) LETTERS
#### half width alphabets（ lowercase ）
```
/^[a-z]+$/
```

#### half width alphabets（ uppercase ）
```
/^[A-Z]+$/
```

#### half width alphabets（ lowercase & uppercase ）
```
/^[a-zA-Z]+$/
```

#### half width alphabets（ lowercase & numeric ）
```
/^[a-z0-9]+$/
```

#### half width alphabets（ uppercase & numeric ）
```
/^[A-Z0-9]+$/
```

#### half width alphabets（ uppercase & lowercase & numeric ）
```
/^[a-zA-Z0-9]+$/
```

#### full width HIRAGANA
```
/^[ぁ-ん]+$/
```

#### full width KATAKANA
```
/^[ァ-ン]+$/
```

#### full width HIRAGANA & KATAKANA
```
/^[ぁ-んァ-ン]+$/
```

#### half width KATAKANA
```
/^[ｧ-ﾝﾞﾟ]+$/
```

#### KANJI
```
/^[一-龥]+$/
```

#### full width HIRAGANA & KANJI
```
/^[一-龥ぁ-ん]/
```

#### full width HIRAGANA & full width KATAKANA & KANJI
```
/^[ぁ-んァ-ン一-龥]/
```

## 3) E-MAIL
```
/^S+@S+.S+$/
```

## 4) URL
```
/^http(s)?://([w-]+.)+[w-]+(/[w-./?%&=]*)?/
```

## 5) PHONE
#### 10 decimals NO hyphen ( - )
```
/^d{10}$/
```

#### 11 decimals with NO hyphen ( - )
```
/^d{11}$/
```

#### 11 OR 10 decimals with NO hyphen ( - )
```
/^d{10}$|^d{11}$/
```

## 6) CREDIT CARD
#### Credit card (VISA,Master,Diners,Discover,Amex)
```
/^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6011[0-9]{12}|3(?:0[0-5]|[68][0-9])[0-9]{11}|3[47][0-9]{13})$/
```

## 7) ZIPCODE
#### WITH hyphen ( 7 / 5 / 3 decimals ) XXX-XXXX | XXX-XX | XXX
```
/^[0-9]{3}[-][0-9]{4}$|^[0-9]{3}[-][0-9]{2}$|^[0-9]{3}$/
```

#### WITH hyphen ( 5 decimals : XXX-XX )
```
/^[0-9]{3}[-][0-9]{2}$/
```

#### WITH hyphen ( 7 decimals : XXX - XXXX )
```
/^[0-9]{3}[-][0-9]{4}$/
```

#### NO hyphen ( 3 decimals : XXX )
```
/^[0-9]{3}$/
```

#### NO hyphen ( 5 decimals : XXXXXXX )
```
/^[0-9]{5}$/
```

#### NO hyphen ( 7 decimals : XXXXXXXXX )
```
/^[0-9]{7}$/
```

#### WITH OR WITHOUT hyphen ( 3 / 5 / 7 decimals )
```
/^[0-9]{3}[-][0-9]{4}$|^[0-9]{3}[-][0-9]{2}$|^[0-9]{3}$|^[0-9]{5}$|^[0-9]{7}$/
```
