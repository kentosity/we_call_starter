<script setup lang="ts">
import Input from './components/Input.vue'
import Submit from './components/Submit.vue'
import Caution from './components/Caution.vue'

import { useStore } from './store';
const st = useStore()

function handleSubmit() {
  const str = JSON.stringify(st.$state, null, 2)
  alert(str)
}
</script>

<template>
  <header>
    <a href="https://vuejs.org/" target="_blank">
      <img src="./assets/vue.svg" class="logo vue" alt="Vue logo" />
    </a>
  </header>

  <div class="hero">
    <h1>イベントタイトル<br />ご予約フォーム</h1>
    <p class="">お客様情報を入力</p>
  </div>

  <form>
    <div class="row two-col">
      <Input id="surname" label="姓" type="text" :model="'surname'" />
      <Input id="name" label="名" type="text" :model="'name'" />
    </div>

    <div class="row two-col">
      <Input id="surname-kana" label="セイ" type="text" :model="'surnameKana'" />
      <Input id="surname-mei" label="メイ" type="text" :model="'nameKana'" />
    </div>

    <div class="row">
      <p class="alt-label">性別</p>
      <div>
        <input type="radio" id="male" name="gender" value="male" />
        <label class="radio-label" for="male">男性</label>

        <input type="radio" id="female" name="gender" value="female" />
        <label class="radio-label" for="female">女性</label>

        <input type="radio" id="other" name="gender" value="other" />
        <label class="radio-label" for="other">その他</label>
      </div>
    </div>

    <div class="row">
      <p class="alt-label">生年月日</p>
      <div class="inline-inputs">
        <Input id="year" type="number" :model="'year'" />
        <span>年</span>
        <Input id="month" type="number" :model="'month'" />
        <span>月</span>
        <Input id="date" type="number" :model="'date'" />
        <span>日</span>
      </div>
    </div>

    <div class="row">
      <label for="state">都道府県</label>
      <select v-model="st.todoufuken" id="state" name="state">
        <option value="北海道">北海道</option>
        <option value="青森県">青森県</option>
        <option value="岩手県">岩手県</option>
        <option value="宮城県">宮城県</option>
        <option value="秋田県">秋田県</option>
        <option value="山形県">山形県</option>
        <option value="福島県">福島県</option>
        <option value="茨城県">茨城県</option>
        <option value="栃木県">栃木県</option>
        <option value="群馬県">群馬県</option>
        <option value="埼玉県">埼玉県</option>
        <option value="千葉県">千葉県</option>
        <option value="東京都">東京都</option>
        <option value="神奈川県">神奈川県</option>
        <option value="新潟県">新潟県</option>
        <option value="富山県">富山県</option>
        <option value="石川県">石川県</option>
        <option value="福井県">福井県</option>
        <option value="山梨県">山梨県</option>
        <option value="長野県">長野県</option>
        <option value="岐阜県">岐阜県</option>
        <option value="静岡県">静岡県</option>
        <option value="愛知県">愛知県</option>
        <option value="三重県">三重県</option>
        <option value="滋賀県">滋賀県</option>
        <option value="京都府">京都府</option>
        <option value="大阪府">大阪府</option>
        <option value="兵庫県">兵庫県</option>
        <option value="奈良県">奈良県</option>
        <option value="和歌山県">和歌山県</option>
        <option value="鳥取県">鳥取県</option>
        <option value="島根県">島根県</option>
        <option value="岡山県">岡山県</option>
        <option value="広島県">広島県</option>
        <option value="山口県">山口県</option>
        <option value="徳島県">徳島県</option>
        <option value="香川県">香川県</option>
        <option value="愛媛県">愛媛県</option>
        <option value="高知県">高知県</option>
        <option value="福岡県">福岡県</option>
        <option value="佐賀県">佐賀県</option>
        <option value="長崎県">長崎県</option>
        <option value="熊本県">熊本県</option>
        <option value="大分県">大分県</option>
        <option value="宮崎県">宮崎県</option>
        <option value="鹿児島県">鹿児島県</option>
        <option value="沖縄県">沖縄県</option>
      </select>
    </div>

    <div class="row">
      <Input id="address" label="住所" type="text" :model="'address'" />
    </div>

    <div class="row">
      <Input id="email" label="メールアドレス" type="email" :model="'email'" />
    </div>

    <Caution :msg="'本イベントに関して、ご連絡させていただく可能性がございます。'" />

    <Submit @submit="handleSubmit" />
  </form>
</template>
