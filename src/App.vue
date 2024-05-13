<script setup lang="ts">
import { useStore } from './store';
const store = useStore()
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

  <form action="">
    <div class="row two-col">
      <div>
        <label for="">姓</label>
        <input type="text" placeholder="姓">
      </div>
      <div>
        <label for="">名</label>
        <input type="text" placeholder="名">
      </div>
    </div>

    <div class="row two-col">
      <div>
        <label for="">セイ</label>
        <input type="text" placeholder="セイ">
      </div>
      <div>
        <label for="">メイ</label>
        <input type="text" placeholder="メイ">
      </div>
    </div>

    <div class="row">
      <p class="alt-label">性別</p>
      <div>
        <input type="radio" id="contactChoice1" name="contact" value="email" />
        <label class="radio-label" for="contactChoice1">男性</label>

        <input type="radio" id="contactChoice2" name="contact" value="phone" />
        <label class="radio-label" for="contactChoice2">女性</label>

        <input type="radio" id="contactChoice3" name="contact" value="mail" />
        <label class="radio-label" for="contactChoice3">その他</label>
      </div>
    </div>

    <div class="row">
      <p class="alt-label">生年月日</p>
      <div class="inline-inputs">
        <input type="number" id="contactChoice1" name="" value="" placeholder="2000" />
        <span class="">年</span>
        <input type="number" id="contactChoice1" name="" value="" placeholder="04" />
        <span class="">月</span>
        <input type="number" id="contactChoice1" name="" value="" placeholder="22" />
        <span class="">日</span>
      </div>
    </div>

    <div class="row">
      <label for="contactChoice1">都道府県</label>
      <select name="" id="">
        <option value="test">test</option>
      </select>
    </div>

    <div class="row">
      <label for="">住所</label>
      <input type="text" placeholder="住所">
    </div>

    <div class="row">
      <label for="">メールアドレス</label>
      <input type="text" placeholder="メアド">
    </div>

    <div class="row">
      <p class="caution">※本イベントに関して、ご連絡させていただく可能性がございます。</p>
    </div>

    <button @click="store.increment">来場日時の選択へ</button>
  </form>
</template>
