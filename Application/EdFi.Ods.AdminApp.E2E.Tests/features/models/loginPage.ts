import { AdminAppPage } from "./adminAppPage";

export class LoginPage extends AdminAppPage {
    emailInput = "input#Email";
    passwordInput = "input#Password";
    passwordConfirmInput = "input#ConfirmPassword";
    submitBtn = 'button[type="submit"]';
    registerNewUserBtn = "a.btn:text('Register as a new user')";
    registerBtn = 'button[type="submit"]';

    path(): string {
        return `${this.url}/Identity/Login`;
    }

    needsFirstTimeSetup(): boolean {
        return this.page.url().includes("FirstTimeSetup");
    }

    async fillForm(username?: string, password?: string): Promise<void> {
        if (username && password) {
            await this.page.fill(this.emailInput, username);
            await this.page.fill(this.passwordInput, password);
        } else {
            throw "Could not find email or password. Verify that variables are set in the .env file";
        }
    }

    async fillPasswordConfirm(password?: string) {
        if (password) {
            await this.page.fill(this.passwordConfirmInput, password);
        }
    }

    async login(): Promise<void> {
        await this.page.click(this.submitBtn);
    }

    async fullLogin(username?: string, password?: string): Promise<void> {
        await this.navigate();
        await this.fillForm(username, password);
        await this.login();
    }

    async fullRegistration(email?: string, password?: string) {
        await this.startRegistration();
        await this.fillForm(email, password);
        await this.fillPasswordConfirm(password);
        await this.register();
    }

    async hasRegisterButton(): Promise<boolean> {
        return await this.hasText("Register as a new user", "a.btn");
    }

    async startRegistration(): Promise<void> {
        await Promise.all([this.clickOnRegisterFromLogin(), this.page.waitForNavigation()]);
    }

    async register() {
        await this.page.click(this.registerBtn);
    }

    private async clickOnRegisterFromLogin(): Promise<void> {
        await this.page.click(this.registerNewUserBtn);
    }
}
