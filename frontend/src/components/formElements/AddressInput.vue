<script setup lang="ts">
import Row from './FormRow.vue'
import Input from '../Input.vue'
</script>

<template>
    <Row>
        <Input id="address" label="住所" type="text" :model="'address'" />
    </Row>
</template>