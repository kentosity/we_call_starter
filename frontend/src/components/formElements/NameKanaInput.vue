<script setup lang="ts">
import Input from '../Input.vue'
import Row from './FormRow.vue'
</script>

<template>
    <Row :two-col="true">
        <Input id="surname-kana" label="セイ" type="text" :model="'surnameKana'" />
        <Input id="surname-mei" label="メイ" type="text" :model="'nameKana'" />
    </Row>
</template>