<script setup lang="ts">
import Row from './FormRow.vue'
import Input from '../Input.vue'
</script>

<template>
    <Row>
        <Input id="email" label="メールアドレス" type="email" :model="'email'" />
    </Row>
</template>