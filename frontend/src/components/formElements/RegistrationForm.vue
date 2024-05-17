<script setup lang="ts">
import { RouteLocationRaw, useRouter } from 'vue-router'
import { onMounted, ref } from 'vue'

import NameInput from '@/components/formElements/NameInput.vue'
import NameKanaInput from '@/components/formElements/NameKanaInput.vue'
import GenderInput from '@/components/formElements/GenderInput.vue'
import BirthdayInput from '@/components/formElements/BirthdayInput.vue'
import PrefectureInput from '@/components/formElements/PrefectureInput.vue'
import AddressInput from '@/components/formElements/AddressInput.vue'
import EmailInput from '@/components/formElements/EmailInput.vue'
import Caution from '@/components/Caution.vue'
import Submit from '@/components/Submit.vue'

import { useFormStore } from '@/stores/registrationFormStore'
import { retrieveAccessToken } from '@/helpers/lineAuthentication'
import { createNewEntry, retrieveExistingEntry, updateExistingEntry } from '@/helpers/formRequestHandler'

const router = useRouter()
const formStore = useFormStore()
const accessToken = retrieveAccessToken()
const hasRecord = ref(false)
const requestError = ref('')

onMounted(async () => {
    const data = await retrieveExistingEntry(accessToken)
    if (data === null) return

    formStore.updateData(data)
    hasRecord.value = true
})

const handleFormInput = async () => {
    let routeLocation: RouteLocationRaw = {
        path: '/result',
        query: undefined
    }

    if (hasRecord.value) {
        const updatedData = await updateExistingEntry(accessToken, formStore)
        if (updatedData === null) return requestError.value = 'アップデートに失敗しました'
        routeLocation.query = updatedData
    }

    const createdData = await createNewEntry(accessToken, formStore)
    if (createdData === null) return requestError.value = '作成に失敗しました'
    routeLocation.query = createdData || undefined

    router.push(routeLocation)
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

        <p v-if="requestError" class="error-message">{{ requestError }}</p>

        <Submit @submit="handleFormInput" />
    </form>
</template>