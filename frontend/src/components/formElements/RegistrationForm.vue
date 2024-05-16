<script setup lang="ts">
import { useRouter } from 'vue-router'
import axios from 'axios'

import NameInput from '../formElements/NameInput.vue'
import NameKanaInput from '../formElements/NameKanaInput.vue'
import GenderInput from '../formElements/GenderInput.vue'
import BirthdayInput from '../formElements/BirthdayInput.vue'
import PrefectureInput from '../formElements/PrefectureInput.vue'
import AddressInput from '../formElements/AddressInput.vue'
import EmailInput from '../formElements/EmailInput.vue'

import Caution from '../Caution.vue'
import Submit from '../Submit.vue'

import { useFormStore } from '../../store';
const router = useRouter()
const formStore = useFormStore()

async function handleFormInput() {
    const currentState = formStore.$state
    const birthday = `${currentState.year}-${currentState.month}-${currentState.date}`

    const res = await axios.post('/api/entries', {
        ...currentState,
        birthday
    })

    router.push({ path: '/result', query: res.data })
}
</script>

<template>
    <form>
        <NameInput></NameInput>

        <NameKanaInput></NameKanaInput>

        <GenderInput></GenderInput>

        <BirthdayInput></BirthdayInput>

        <PrefectureInput></PrefectureInput>

        <AddressInput></AddressInput>

        <EmailInput></EmailInput>

        <Caution :msg="'本イベントに関して、ご連絡させていただく可能性がございます。'" />

        <Submit @submit="handleFormInput" />
    </form>
</template>