require("dotenv").config();

const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
    res.json({
        message: "Erickson Business API online"
    });
});

app.get("/api/services", async (req, res) => {

    try {

        const db = require("./config/database");

        const result = await db.query(
            "SELECT * FROM services WHERE active = TRUE ORDER BY id"
        );

        res.json(result.rows);

    } catch (error) {

        console.error(error);

        res.status(500).json({
            message: "Erro ao buscar serviços"
        });

    }

});


const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {

    console.log(
        `Servidor Erickson Business rodando na porta ${PORT}`
    );

});