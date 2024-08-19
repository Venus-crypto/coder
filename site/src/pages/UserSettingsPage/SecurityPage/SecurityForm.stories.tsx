import type { Meta, StoryObj } from "@storybook/react";
import { mockApiError } from "testHelpers/entities";
import { SecurityForm } from "./SecurityForm";

const meta: Meta<typeof SecurityForm> = {
	title: "pages/UserSettingsPage/SecurityForm",
	component: SecurityForm,
	args: {
		isLoading: false,
	},
};

export default meta;
type Story = StoryObj<typeof SecurityForm>;

export const Example: Story = {
	args: {
		isLoading: false,
	},
};

export const Loading: Story = {
	args: {
		isLoading: true,
	},
};

export const WithError: Story = {
	args: {
		error: mockApiError({
			message: "Old password is incorrect",
			validations: [
				{
					field: "old_password",
					detail: "Old password is incorrect.",
				},
			],
		}),
	},
};
