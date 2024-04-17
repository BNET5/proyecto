import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConsultaEvento extends JFrame implements ActionListener {

    private JComboBox<String> cmbEstado;
    private JButton btnConsultar, btnCerrar;
    private JTextArea txtResultados;

    public ConsultaEvento() {
        setTitle("🎵 Consulta de Eventos"); // Emoji para el icono de evento
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setIconImage(new ImageIcon("icono.png").getImage()); // Reemplaza "icono.png" con la ruta de tu ícono

        getContentPane().setBackground(new Color(12, 171, 168));

        cmbEstado = new JComboBox<>(new String[]{"Activos", "Inactivos"});
        btnConsultar = new JButton("🔍 Consultar");
        btnCerrar = new JButton("❌ Cerrar");
        txtResultados = new JTextArea(10, 40);

        btnConsultar.addActionListener(this);
        btnCerrar.addActionListener(this);

        setLayout(new GridLayout(4, 2));
        add(createLabel("🔍 Estado del evento:"));
        add(cmbEstado);
        add(new JLabel()); // Espacio en blanco
        add(btnConsultar);
        add(createLabel("📋 Resultados:"));
        add(new JScrollPane(txtResultados));
        add(new JLabel()); // Espacio en blanco
        add(btnCerrar);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == btnConsultar) {
            consultarEventos();
        } else if (e.getSource() == btnCerrar) {
            cerrarVentana();
        }
    }

    private void consultarEventos() {
        String estadoSeleccionado = (String) cmbEstado.getSelectedItem();
        boolean estadoActivo = estadoSeleccionado.equals("Activos");

        String jdbcUrl = "jdbc:mysql://localhost:3306/bd_discoteca";
        String usuario = "root";
        String contraseña = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexion = DriverManager.getConnection(jdbcUrl, usuario, contraseña);

            String consulta = "SELECT * FROM Eventos WHERE Estado_evento = ?";
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setBoolean(1, estadoActivo);

            ResultSet resultSet = statement.executeQuery();

            StringBuilder resultados = new StringBuilder();
            while (resultSet.next()) {
                resultados.append("ID_evento: ").append(resultSet.getInt("ID_evento"))
                        .append(", Nombre_evento: ").append(resultSet.getString("Nombre_evento"))
                        .append(", Fecha_hora_evento: ").append(resultSet.getString("Fecha_hora_evento"))
                        .append(", Descripcion_evento: ").append(resultSet.getString("Descripcion_evento"))
                        .append(", Artistas_DJ_invitados: ").append(resultSet.getString("Artistas_DJ_invitados"))
                        .append(", Capacidad_maxima_evento: ").append(resultSet.getInt("Capacidad_maxima_evento"))
                        .append(", Precio_entrada: ").append(resultSet.getBigDecimal("Precio_entrada"))
                        .append(", Estado_evento: ").append(resultSet.getBoolean("Estado_evento"))
                        .append("\n");
            }

            txtResultados.setText(resultados.toString());

            resultSet.close();
            statement.close();
            conexion.close();

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    private void cerrarVentana() {
        this.dispose();
    }

    private JLabel createLabel(String text) {
        JLabel label = new JLabel(text);
        label.setForeground(Color.BLACK);
        return label;
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            ConsultaEvento consultaEvento = new ConsultaEvento();
            consultaEvento.setVisible(true);
        });
    }
}
