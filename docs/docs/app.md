# Preact App + TypeScript
WeCode's frontend is designed to be lightweight, fast, and scalable, ensuring a seamless user experience. 
By using Preact, we achieve high performance with a minimal bundle size, making our application more efficient. 
TypeScript enhances the development process by providing type safety, reducing errors, and improving maintainability.
The frontend is built with modern tools, ensuring faster development.

> **Note**: Our focus is on **performance and functionality** over UI design, so the site's appearance may not appeal to everyone.

## WeCode's frontend is build using: 
* [Preact.js](https://preactjs.com/) - A fast and lightweight alternative to React.js
* [TypeScript](https://www.typescriptlang.org/) - A strongly typed & safer alternative to JavaScript
* [TailwindCSS](https://tailwindcss.com/) - CSS framework for rapid UI development
* [Vite](https://vite.dev/) - A fast and modern frontend build tool

## App structure
    app/                                   
        index.html
        package.json
        public
        src/                               #
            app.tsx                        # Defines all routes/ pages
            components/                    #
                commons/                   # common components (buttons, forms, etc...)
                    ToggleTheme.tsx        # Toggle theme button
                GlobalFooter.tsx
                GlobalHeader.tsx
                Notification.tsx
            context/
                AuthContextProvider.tsx    # auth context (isAuthenticated)
                ThemeContextProvider.tsx   # Theme context
            index.css                      # the ONLY css file
            main.tsx                       # tsx entry point
            routes/                        # All routes/ pages
                AboutRoute.tsx             # About us page
                auth/
                    AuthIndex.tsx          # Auth index/ default page, redirecting to /login, /register OR / (home)
                    AuthLayout.tsx         # Auth layout
                    LoginRoute.tsx         # Login/ Sign in page
                    RegisterRoute.tsx      # Register/ Sign up page
                challenges/
                    ChallengesLayout.tsx   # /challenges layout
                    ChallengesList.tsx     # List all challenges/ questions, with pagination, default route for /challenges
                    QuestionRoute.tsx      # Specific questions route, takes one param (quesId)
                ErrorRoute.tsx             # Default route for error, page not found, wrong route, etc...
                GlobalLayout.tsx           # Global layout for: home, about, challanges, servers, etc... pages
                home/
                    HomeRoute.tsx          # Home page default route
            vite-env.d.ts
        tsconfig.app.json
        tsconfig.json
        tsconfig.node.json
        vite.config.ts
