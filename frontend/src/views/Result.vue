<script setup lang="ts">
import { useRoute } from 'vue-router'
const route = useRoute()
</script>

<template>
    <div class="hero">
        <h1>お問い合わせありがとうございます。</h1>
    </div>

    <pre>
        {{ JSON.stringify(route.query, null, 2) }}
    </pre>

    <router-link to="/">戻る</router-link>
</template>
