<script setup lang="ts">
import Input from './components/Input.vue'
import Submit from './components/Submit.vue'
import Caution from './components/Caution.vue'

import prefectures from './assets/prefectures'

import { useStore } from './store';
const st = useStore()

function handleFormInput() {
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
      <select v-model="st.prefecture" id="state" name="state">
        <option v-for="(prefecture, ix) in prefectures" :value="prefecture" :key="ix">{{ prefecture }}</option>
      </select>
    </div>

    <div class="row">
      <Input id="address" label="住所" type="text" :model="'address'" />
    </div>

    <div class="row">
      <Input id="email" label="メールアドレス" type="email" :model="'email'" />
    </div>

    <Caution :msg="'本イベントに関して、ご連絡させていただく可能性がございます。'" />

    <Submit @submit="handleFormInput" />
  </form>
</template>
