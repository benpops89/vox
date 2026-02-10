<div align="center">
  <h1>📡 VOX</h1>
  <h3>Open Source DIY Smart Speaker</h3>
  <p>
    Open-source DIY smart speaker for Home Assistant—from CAD to code.
  </p>
</div>

<br>

---

## 📖 Vision

**VOX** is an end-to-end guide and toolkit for building your own smart speaker. The project is structured into three main pillars:

1.  **💿 Base OS:** Automated generation of a clean, headless operating system (DietPi).
2.  **⚙️ Configuration:** Ansible playbooks to install and configure audio services (Snapcast, Spotify Connect, AirPlay, etc.).
3.  **🛠️ Hardware:** 3D printable CAD models (STL/STEP) and a Bill of Materials (BOM) for the electronics.

---

## 🏗️ Phase 1: Base OS Image

The foundation of the speaker is a custom-configured DietPi image, built automatically using HashiCorp Packer and Docker. This ensures a reproducible, clean start for every device.

### Prerequisites

*   **Docker:** Required to run the Packer builder container.
*   **[Mise](https://mise.jdx.dev/):** (Optional) Used as a task runner.

### Configuration

Non-sensitive defaults are stored in `variables.pkrvars.hcl`. **Sensitive credentials** (WiFi, SSH, Global Password) must be provided via environment variables.

### Secrets Management

Export the following environment variables before building. You can add these to a `.env` file (ensure this file is git-ignored).

```bash
export WIFI_SSID="MyNetwork"
export WIFI_PASSWORD="SuperSecretPassword"
export DIETPI_GLOBAL_PASSWORD="ChangeMeImmediately"
```

### Build Command

Run the build using **Mise**:

```bash
mise run build
```

Or using **Docker** directly:

```bash
docker run --rm --privileged \
    -v /dev:/dev \
    -v ${PWD}:/build \
    mkaczanowski/packer-builder-arm:latest \
    build -var-file=variables.pkrvars.hcl .
```

---

## 🔜 Roadmap

*   **Phase 2: Software Configuration (Ansible)**
    *   Automated setup of audio subsystems (ALSA, PulseAudio/PipeWire).
    *   Installation of streaming services (Spotifyd, Shairport-Sync, Snapclient).
    *   Voice assistant integration (Rhasspy/Home Assistant).

*   **Phase 3: Hardware & Assembly**
    *   **BOM:** Full parts list (SBC, DAC/Amp, Drivers, Power Supply).
    *   **CAD:** Enclosure files ready for 3D printing.
    *   **Assembly:** Step-by-step wiring and assembly guide.

## 📄 License

This project is open source. Please refer to the [DietPi](https://dietpi.com/) documentation for upstream licensing and usage details.
